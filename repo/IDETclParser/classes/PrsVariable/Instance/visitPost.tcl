PrsVariable instproc visitPost visitor {
    if {[my exists key]} {
        [my set key] visitPost $visitor
    }
    next
}
