IDE::TclKitDeployer instproc wrap {} { 
   set out [lindex $argv 0]
   set idir [file root [file tail $out]].vfs
   set compress 1
   set verbose 0
   set ropts -readonly
   set prefix 0
   set reusefile 0
   set prog tclkit
   set type mk4
   set macbin 0
   set explist {}
   set syncopts {}

set a [lindex $argv 1]
while {[string match -* $a]} {
  switch -- $a {
    -interp {
      set prog [lindex $argv 2]
      set argv [lreplace $argv 1 2]
    }
    -runtime {
      set pfile [lindex $argv 2]
      if {$pfile == $out} {
	set reusefile 1
      } else {
	set header [my LoadHeader [lindex $argv 2]]
      }
      set argv [lreplace $argv 1 2]
      set prefix 1
    }
    -macbinary {
      set macbin 1
      set argv [lreplace $argv 1 1]
    }
    -writable -
    -writeable {
      #set ropts "-nocommit"
      set ropts ""
      set argv [lreplace $argv 1 1]
    }
    -nocomp -
    -nocompress {
      set compress 0
      set argv [lreplace $argv 1 1]
    }
    -verbose {
      set verbose 1
      set argv [lreplace $argv 1 1]
    }
    -zip {
      set type zip
      set argv [lreplace $argv 1 1]
    }
    -uncomp {
      lappend explist [lindex $argv 2]
      set argv [lreplace $argv 1 2]
    }
    default {
      lappend syncopts [lindex $argv 1] [lindex $argv 2]
      set argv [lreplace $argv 1 2]
    }
  }
  set a [lindex $argv 1]
}

if {![file isdir $idir]} {
  puts stderr "Input directory not found: $idir"
  exit 1
}

if {!$prefix} {
  regsub @PROG@ $header $prog header
  regsub @OPTS@ $header $ropts header
  regsub @TYPE@ $header $type header

  set n [string length $header]
  while {$n <= 240} {
    append header ################
    incr n 16
  }

  set slop [expr { 15 - (($n + 15) % 16) }]
  for {set i 0} {$i < $slop} {incr i} {
    append header #
  }
  set n [string length $header]
  if {$n % 16 != 0} {
    error "Header size is $n, should be a multiple of 16"
  }
}

# pull apart macbinary file, if asked (and if it looks like one)
if {$macbin} {
  binary scan $header cc@122cc c1 c2 c3 c4
  if {$c1 != 0 || $c1 < 0 || $c1 > 63 || $c2 >= 0 || $c3 >= 0} {
    puts stderr "runtime file is not in MacBinary format"
    exit 1
  }
  binary scan $header a83Ia37Sa2 mb_hd1 mb_dlen mb_hd2 mb_crc mb_end
  binary scan $header @128a${mb_dlen}a* header mb_tail
}

if {!$reusefile} {
  my writefile $out $header
}

set origsize [file size $out]

switch $tcl_platform(platform) {
  unix {
    catch {file attributes $out -permissions +x}
  }
  windows {
    set batfile [file root $out].bat
    if {![file exists $batfile]} {
      set fd [open $batfile w]
      puts -nonewline $fd "@$prog [file tail $out] %1 %2 %3 %4 %5 %6 %7 %8 %9"
      close $fd
    }
  }
  macintosh {
    catch {file attributes $out -creator TKd4}
  }
}

# 2003-02-08: added code to patch icon in windows executable
# triggered by existence of tclkit.ico in vfs dir *and* tclkit.ico in orig

# careful: this applies only to windows executables, but the
# icon replacement can in fact take place on any platform...

if {[info exists origicon] && [file exists [file join $idir tclkit.ico]]} {
  puts " customizing tclkit.ico in executable"
  set custicon [my readfile [file join $idir tclkit.ico]]
  array set newimg [my decICO $custicon]
  foreach {k v} [decICO $origicon] {
    if {[info exists newimg($k)]} {
      set len [string length $v]
      set pos [string first $v $header]
      if {$pos < 0} {
	puts " icon $k: NOT FOUND"
      } elseif {[string length $newimg($k)] != $len} {
	puts " icon $k: NOT SAME SIZE"
      } else {
	binary scan $header a${pos}a${len}a* prefix - suffix
	set header "$prefix$newimg($k)$suffix"
	puts " icon $k: replaced"
      }
    }
  }
  my writefile $out $header
}

switch $type {
  mk4 {
    vfs::mk4::Mount $out $out
    set argv $syncopts
    lappend argv -compress $compress -verbose $verbose -noerror 0 $idir $out

    source [file join [file dirname [info script]] sync.tcl] 

      # leave a marker inside the scripted doc about the header
      # 2002-07-07, disabled, until need is properly determined
    if {0 && $prefix} {
      set ofile [file join $out .original]
      set fd [open $ofile w]
      puts $fd $origsize
      close $fd
      file mtime $ofile $origtime
    }
    
      # 2003-06-19: new "-uncomp name" option to store specific file(s)
      #		    in uncompressed form, even if the rest is compressed
    set o $mk4vfs::compress
    set mk4vfs::compress 0
    foreach f $explist {
      file delete -force [file join $out $f]
      file copy [file join $idir $f] [file join $out $f]
    }
    set mk4vfs::compress $o

    vfs::unmount $out
  }
}

# re-assemble mac binary file if we pulled it apart before
if {[info exists mb_end]} {
  source [file join [file dirname [info script]] crc16.tcl]

  set newdata [my readfile $out]

  set h $mb_hd1
  append h [binary format I [string length $newdata]]
  append h $mb_hd2
  append h [binary format S [crc::crc-ccitt -seed 0 $h]]
  append h mb_end

  set fd [open $out w]
  fconfigure $fd -translation binary
  puts -nonewline $fd $h
  puts -nonewline $fd $newdata
  puts -nonewline $fd $mb_tail
  close $fd
}

}
