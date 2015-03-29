IntroRepoBuilder instproc dumpRepo {} {
    my instvar commandsArr methodsArr xotclObjectsArr

    set ret "array set commandsArr {\n"
    foreach c [lsort [array names commandsArr]] {
        set sdesc $commandsArr($c)
        if {[llength $sdesc]>1} {
            append ret [list $c] " \{\n  \{"
            append ret [join $sdesc "\}\n  \{"]
            append ret "\}\n\}\n"

        } else {
            append ret [list $c] " " [list $sdesc] \n
        }
    }
    append ret "\n}\n"

    append ret "array set methodsArr {\n"
    foreach c [lsort [array names methodsArr]] {
        set sdesc $methodsArr($c)
        if {[llength $sdesc]>1 && [llength [lindex $sdesc 0]]>1} {
            append ret [list $c] " \{\n  \{"
            append ret [join $sdesc "\}\n  \{"]
            append ret "\}\n\}\n"

        } else {
            append ret [list $c] " " [list $sdesc] \n
        }
    }
    append ret "\n}\n"

    append ret "array set xotclObjectsArr {\n"
    foreach c [lsort [array names xotclObjectsArr]] {
        set sdesc $xotclObjectsArr($c)
        append ret [list $c] " " [list $sdesc] \n
    }
    append ret "\n}\n"

    return $ret
}
