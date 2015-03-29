IDE::BreakpointFasade proc getMethodForDescriptionList {vctype vclass method} {
    if {$vctype eq "Tcl Procs" || $vctype eq "Procs"} {
        return $method
    } else {
        if {$vctype eq "Instance"} {
            return xotcl::classes::${vclass}::${method}
        } else {
            return ${vclass}::${method}
        }
    }
}
