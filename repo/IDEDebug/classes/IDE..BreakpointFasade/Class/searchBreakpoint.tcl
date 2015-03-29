IDE::BreakpointFasade proc searchBreakpoint {vctype vclass oomethod} {
    my instvar breakpointsArr methodArr
    set method [my getMethodForDescriptionList $vctype $vclass $oomethod]
    if {[info exists methodArr($method)]} {
        set handle $methodArr($method)
        if {[info exists breakpointsArr($handle)]} {
            return $breakpointsArr($handle)
        } else {
            # clean up deleted breakpoint
            unset methodArr($method)
        }
    }
    return {}
}
