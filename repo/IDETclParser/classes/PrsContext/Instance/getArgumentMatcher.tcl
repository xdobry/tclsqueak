PrsContext instproc getArgumentMatcher {} {
    my instvar argMatcher
    if {![info exists argMatcher]} {
        set argMatcher [PrsArgumentMatcher new -childof [self] -context [self]]
    }
    return $argMatcher
}
