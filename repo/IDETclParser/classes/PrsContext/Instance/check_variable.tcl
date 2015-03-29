PrsContext instproc check_variable {count command notifier} {
    for {set index 1} {$index<=$count} {incr index 2} {
        if {$index+1<=$count} {
            my addVariableFrom [$command getElem $index] $notifier [my getTypeFromElem [$command getElem [expr {$index+1}]]] global
        } else {
            my addVariableFrom [$command getElem $index] $notifier [list def] global
        }
    }
}
