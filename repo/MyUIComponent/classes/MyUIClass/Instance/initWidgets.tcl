MyUIClass instproc initWidgets {} {
    my instvar win textVariable root
    
    # please adapt the widgets here
    
    set textVariable "example text"
    
    # example text entry width label and variable binding (to object variable)
    ttk::label $win.label -text "Text Entry:"
    ttk::entry $win.entry -textvariable [self]::textVariable
    
    # create frame for text widget with scroll
    frame $win.ftext
    text $win.ftext.text -yscrollcommand [list $win.ftext.scroll set] -width 20 -height 10
    ttk::scrollbar $win.ftext.scroll -command [list $win.ftext.text yview] -takefocus 0
    pack $win.ftext.scroll -side right -fill y
    pack $win.ftext.text -expand yes -fill both

    # 2 buttons in new frame
    frame $win.buttons
    ttk::button $win.buttons.accept -text "Accept" -command [list [self] btn_accept_click]
    ttk::button $win.buttons.cancel -text "Cancel" -command [list [self] btn_cancel_click]
    pack $win.buttons.cancel $win.buttons.accept -side right
    
    # use grid manager to place all widget
    # first column is label and entry
    # 2nd column is text widget (occupies 2 columns)
    # 3rd column is button frame (links anchored)
    
    grid $win.label -column 0 -row 0
    grid $win.entry -column 1 -row 0 -sticky we
    grid $win.ftext -column 0 -row 1 -columnspan 2 -sticky news
    grid $win.buttons -column 0 -row 2 -columnspan 2 -sticky we
    # the column 1 und row 1 should be stretchable
    grid columnconfigure $root 1 -weight 1
    grid rowconfigure $root 1 -weight 1
}
