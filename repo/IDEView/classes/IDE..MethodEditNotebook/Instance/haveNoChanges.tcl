IDE::MethodEditNotebook instproc haveNoChanges {} {
    set currentView [my getCurrentMethodEdit]
    if {$currentView ne ""} {
        return [$currentView haveNoChanges]
    }
    return 0
}
