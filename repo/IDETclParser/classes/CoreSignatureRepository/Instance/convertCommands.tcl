CoreSignatureRepository instproc convertCommands {} {
    my instvar commandsArr

    set ret ""
    foreach c [lsort [array names commandsArr]] {
        set desc $commandsArr($c)
        if {[llength $desc]==2} {
            append ret [list $c] " " [list $desc] \n
        } else {
            set sdesc [my convertDesc $desc]
            if {[llength $sdesc]>1} {
                append ret [list $c] " \{\n  \{"
                append ret [join $sdesc "\}\n  \{"]
                append ret "\}\n\}\n"

            } else {
                append ret [list $c] " " [list $sdesc] \n
            }
        }
    }
    return $ret
}
