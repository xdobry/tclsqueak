IDE::MethodEditNotebook instproc showRef {} {
    set currentView [my getCurrentMethodEdit]
    if {$currentView ne ""} {
        set twin [$currentView getTextWindow]
        $currentView showRef [$twin tag names current]
    }
}
