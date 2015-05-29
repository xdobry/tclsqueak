IDE::MethodEditNotebook instproc notebookTabChanged {} {
    set currentView [my getCurrentMethodEdit]
    if {$currentView ne ""} {
        set content [my getContentForView $currentView]
        if {$content ne ""} {
            [my info parent] @codecontroller showNavigation $content
            my setButtonState saveButton [$currentView hasModifications]
        }
    }
}
