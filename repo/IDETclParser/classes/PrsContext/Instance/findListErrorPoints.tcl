PrsContext instproc findListErrorPoints script {
    # search hint or missing close bracket (find the open bracket)
    # assumption
    # if \{ starts im middle of line so \} should end also in this line
    # if \{ starts at end of line it should end in the same ident block but as first character

    set script [string map [list "\\\{" __ "\\\}" __] $script]

    set openbracesi [regexp -inline -indices -all "\\\{" $script]
    set closebracesi [regexp -inline -indices -all "\\\}" $script]

    if {[llength $openbracesi]==[llength $closebracesi]} {
        return
    }

    set newlines [list]
    foreach n [regexp -inline -indices -all \n $script] {
        lappend newlines [lindex $n 0]
    }
    set linestarts [linsert $newlines 0 -1]

    set braces [list]
    foreach b $openbracesi {
        set bpos [lindex $b 0]
        set line [my findLineForPos $newlines $bpos]
        set ident -1
        # get ident if last character in line
        if {[regexp -linestop -start $bpos+1 {\A[ \t]*\n} $script]} {
            # is  last character so get ident
            if {[regexp -start [lindex $linestarts $line]+1 {\A\s+} $script idents]} {
                set ident [string length $idents]
            } else {
                set ident 0
            }
        }
        lappend braces [list $bpos o $line $ident]
    }
    foreach b $closebracesi {
        set bpos [lindex $b 0]
        set line [my findLineForPos $newlines $bpos]
        set ident -1
        # get ident if first character in line
        set linec [string range $script [lindex $linestarts $line]+1 $bpos-1]
        if {[regexp {^\s*$} $linec]} {
            set ident [string length $linec]
        }
        lappend braces [list $bpos c $line $ident]
    }
    set braces [lsort -index 0 -integer $braces]

    set obrace $braces

    # remove all elements which are consistent
    # direct open and close in same line (nested) repeat
    # last open and first close with same ident
    set wasremoved 1
    set t 0
    while {$wasremoved} {
        set wasremoved 0
        set len [llength $braces]
        set nbraces [list]
        for {set i 0} {$i<$len} {incr i} {
            if {$i==$len-2} {
                lappend nbraces [lindex $braces $i]
            }
            lassign [lindex $braces $i] pos1 type1 line1 ident1
            lassign [lindex $braces $i+1] pos2 type2 line2 ident2
            if {$type1 eq "o" && $type2 eq "c" && ($line1==$line2 || $ident1==$ident2)} {
                set wasremoved 1
                incr i
            } else {
                lappend nbraces [lindex $braces $i]
            }
        }
        if {$wasremoved} {
            set braces $nbraces
        }
    }
    if {[llength $openbracesi]>[llength $closebracesi]} {
        set lastopen 0
        foreach b $braces {
            if {[lindex $b 1] eq "o"} {
                set lastopen [lindex $b 0]
            }
        }
        return [list $lastopen $lastopen "Insert \} to complete method block for this bracket"]
    } else {
        set firstclose 0
        foreach b $braces {
            if {[lindex $b 1] eq "c"} {
                set firstclose [lindex $b 0]
                break
            }
        }
        return [list $firstclose $firstclose "Insert \{ to complete method block for this bracket"]
    }
}
