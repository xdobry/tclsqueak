IDE::IDialogWithCheck instproc init {} {
    my instvar win
    next
    my requireNamespace
    ::checkbutton $win.check -text [my checktext] -variable [self]::check
    pack $win.check -fill both -expand yes -before $win.buttons -padx 10 -pady 5
    wm deiconify $win
}
