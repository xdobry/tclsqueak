IDE::MethodEditNotebook instproc canSetBreakpoint {} {
    set currentView [my getCurrentMethodEdit]
    if {$currentView ne ""} {
        return [$currentView canSetBreakpoint]
    }
    return 0
}
