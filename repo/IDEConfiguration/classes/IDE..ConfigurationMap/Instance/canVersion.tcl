IDE::ConfigurationMap instproc canVersion {} {
    if {[my set isclosed]} {return 0}
    foreach c [my getComponents] {
        if {![$c isclosed]} {return 0}
    }
    return 1
}
