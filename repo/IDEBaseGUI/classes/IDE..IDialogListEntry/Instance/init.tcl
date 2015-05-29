IDE::IDialogListEntry instproc init {} {
    my instvar win list entry selectedItem
    next
    frame $win.lframe
    ttk::scrollbar $win.lframe.scroll -command "$win.lframe.listbox yview"
    ::listbox $win.lframe.listbox -yscrollcommand "$win.lframe.scroll set"   -exportselection no
    bind $win.lframe.listbox <Double-Button-1> [list [self] actionOk]

    pack $win.lframe.scroll -side right -fill y
    pack $win.lframe.listbox -expand yes -fill both

    if {![info exists list]} {
        set list {}
    } else {
        $win.lframe.listbox insert 0 {*}$list
    }
    ::entry $win.entry
    if {![info exists entry]} {
        set entry {}
    } else {
        $win.entry insert 0 $entry
    }

    pack $win.lframe -fill both -expand yes -before $win.buttons
    pack $win.entry -fill x -before $win.buttons -padx 10 -pady 5

    wm deiconify $win
}
