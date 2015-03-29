TclParser proc isDevelMode {} {
    if {[my exists develMode]} {
        return [my set develMode]
    }
    return 0
}
