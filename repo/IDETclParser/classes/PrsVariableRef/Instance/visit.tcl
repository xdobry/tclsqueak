PrsVariableRef instproc visit visitor {
    next
    if {[my exists key]} {
        [my set key] visit $visitor
    }
}
