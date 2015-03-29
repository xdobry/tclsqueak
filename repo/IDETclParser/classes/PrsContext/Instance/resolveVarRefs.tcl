PrsContext instproc resolveVarRefs {} {
    my instvar varRefs
    if {[info exists varRefs]} {
        foreach {fromVar toVar} $varRefs {
            my checkVariableType $fromVar [list setref [my getVariableType $toVar]] 1
        }
    }
}
