PrsContext instproc check_upvar {count command notifier} {
    my instvar varRefs
    set start [expr {1+$count%2}]
    for {set x $start} {$x<=$count} {incr x} {
        set fromElem [$command getElem $x]
        incr x
        set toElem [$command getElem $x]
        my checkVariableFrom $fromElem $notifier
        my addVariableFrom $toElem $notifier [list def]
        if {[$fromElem hasclass PrsVariable] && [$toElem hasclass PrsVariableRef]} {
            set fromVar [$fromElem getVariableName]
            set toVar [$toElem getVariableName]
            lappend varRefs $fromVar $toVar
        }
    }
}
