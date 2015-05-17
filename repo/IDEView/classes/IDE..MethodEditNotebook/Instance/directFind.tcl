IDE::MethodEditNotebook instproc directFind {} {
    set currentView [my getCurrentMethodEdit]
    if {$currentView ne ""} {
        [my info parent]::@find show [$currentView getTextWindow]
    }
}
