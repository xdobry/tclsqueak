PrsContext instproc getVariableTypes {} {
    my instvar varArr
    if {[array exists varArr]} {
        array get varArr
    } else {
        return
    }
}
