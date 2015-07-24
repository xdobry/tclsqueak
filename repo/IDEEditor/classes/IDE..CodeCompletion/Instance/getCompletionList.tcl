IDE::CodeCompletion instproc getCompletionList {body cursor contentDesc} {
    set linestart [string last \n [string range $body 0 $cursor-1]]
    if {$linestart>0} {
        incr linestart
    } else {
        set linestart 0
    }
    set line [string range $body $linestart $cursor-1]

    set ret [list]
    
    if {[regexp {([\w\$]+|::)} $line]} {
       # remove all before ; or \[
       regexp {[^\[;]+$} $line res
       if {[regexp {(.+)\s+(-\w*)$} $res _ cmdline uoption]} {
           set ret [my getOption $cmdline $uoption]
       } elseif ([regexp {my instvar [ \w]*$} $res cmd]) {
           set ret [my getExpantInstvar $cmd $contentDesc]
       } elseif  {[regexp {([\w:\]]*)(?:\s+|^)([:\w]+)$} $res _ basecommand fchars]} {
           # commands has two tails. Try to complete second tails
           # puts "res '$res' #bas1 '$basecommand' #fc '$fchars'"
           if {$basecommand eq "my" || $basecommand eq "self\]"} {
               # invoke own local method per my or [self]
               set ret [my getInstanceCommand ${fchars}* $contentDesc]
           } elseif {[set introProxy [IDE::XOIntroProxy getIntroProxyForObject $basecommand]] ne ""} {
               # invoke Object method direkt per object name
               set ret [list [my getClassMethods $introProxy $basecommand ${fchars}*] ${fchars}*]
           } elseif {$basecommand in {set append lappend incr unset lset}} {
               set ret [my getVariable $fchars $body $contentDesc]
           } elseif {$basecommand ne "" && [llength [set subcommands [my getSubcommands $basecommand]]]>=0} {
               # complete subcommand as "array get" (get is subcommand)
               set ret [my getProcSubcommand $basecommand ${fchars}* $subcommands]
           } elseif {![string match {$*} $fchars]} {
               set ret [my getBaseIdentifiers ${fchars}* $contentDesc]
           }
       } elseif {[regexp {([\w:\]]+)\s+$} $res _ basecommand]} {
           if {$basecommand eq "my" || $basecommand eq "self\]"} {
               set ret [my getInstanceCommand * $contentDesc]
           } elseif {[set introProxy [IDE::XOIntroProxy getIntroProxyForObject $basecommand]] ne ""} {
               set ret [list [my getClassMethods $introProxy $basecommand] *]
           } elseif {[llength [set subcommands [my getSubcommands $basecommand]]]>=0} {
               set ret [my getProcSubcommand $basecommand * $subcommands]
           }
       } elseif {[regexp {\$([:\w]*)$} $res _ basevariable]} {
           set ret [my getVariable $basevariable $body $contentDesc]
       }
    }
    return $ret
}
