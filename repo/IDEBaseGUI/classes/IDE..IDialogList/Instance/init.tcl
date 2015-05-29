IDE::IDialogList instproc init {} {
    my instvar win list selectedItem selectPattern patternIndex
    next
    my requireNamespace
    frame $win.lframe
    set selectPattern ""
    set patternIndex 0
    ttk::scrollbar $win.lframe.scroll -command "$win.lframe.listbox yview" -takefocus 0
    ::listbox $win.lframe.listbox -yscrollcommand "$win.lframe.scroll set"   -exportselection no
    ::label $win.pattern -textvariable [self]::selectPattern
    bind $win.lframe.listbox <Double-Button-1> [list [self] actionOk]
    bind $win.lframe.listbox <Key> [list [self] keyEvent %K %A]

    pack $win.lframe.scroll -side right -fill y
    pack $win.lframe.listbox -expand yes -fill both

    pack $win.pattern -fill x -expand yes -before $win.buttons
    pack $win.lframe -fill both -expand yes -before $win.buttons
    if {![info exists list]} {
        set list {}
    } else {
        $win.lframe.listbox insert 0 {*}$list

    }
    if {$selectedItem ne ""} {
        my setSelectedItem $selectedItem
    }
    wm deiconify $win
    focus $win.lframe.listbox
}
