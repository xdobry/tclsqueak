IDE::CBCodeController instproc init args {
    my instvar history historyIndex editHistory toolbar lastEditedButton prevButton nextButton
    set history [list]
    set editHistory [list]
    set historyIndex -1
    
    if {[info exists toolbar] && $toolbar ne ""} {
        set lastEditedButton [$toolbar addCommand "Last Edited" [list [self] showLastEdited] last_edit_pos 3.1]
        set prevButton [$toolbar addCommand "Back" [list [self] backNavigation] backward_nav 3.2]
        set nextButton [$toolbar addCommand "Forward" [list [self] forwardNavigation] forward_nav 3.3]
        my setButtonState lastEditedButton 0
        my setButtonState prevButton 0
        my setButtonState nextButton 0
    }
}
