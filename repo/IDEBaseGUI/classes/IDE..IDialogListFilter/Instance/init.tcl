IDE::IDialogListFilter instproc init {} {
    my instvar win pattern selected lpattern
    next
    set selected ""
    set lpattern ""
    my requireNamespace
    set selectPattern ""
    set patternIndex 0
    ::label $win.info -text {Select an item to open (? any character, * any string)}
    ::entry $win.pattern -textvariable [self]::pattern
    frame $win.lframe
    ::scrollbar $win.scroll -command [list $win.listbox yview] -takefocus 0
    ::listbox $win.listbox -yscrollcommand [list $win.scroll set]   -exportselection no
    bind $win.listbox <Double-Button-1> [list [self] actionOk]
    bind $win.pattern <KeyRelease> [list [self] filterList]
    bind $win.pattern <Key-Down> [list [self] browseList]

    pack $win.scroll -side right -fill y -in $win.lframe
    pack $win.listbox -expand yes -fill both -in $win.lframe

    pack $win.info -anchor w -before $win.buttons
    pack $win.pattern -fill x -expand yes -before $win.buttons
    pack $win.lframe -fill both -expand yes -before $win.buttons

    wm deiconify $win
    focus $win.pattern
}
