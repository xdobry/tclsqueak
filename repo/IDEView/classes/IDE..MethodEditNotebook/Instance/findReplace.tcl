IDE::MethodEditNotebook instproc findReplace {} {
    set currentView [my getCurrentMethodEdit]
    if {$currentView ne ""} {
        IDE::FindReplace bindToView $currentView
    }
}
