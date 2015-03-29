PrsContext instproc getVariableNames {} {
    my instvar varArr
    if {[array exists varArr]} {
        array names varArr
    } else {
        return
    }
}
