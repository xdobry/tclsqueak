IDE::TkWinList instproc init args {
    next
    my instvar win
    button $win.upbutton -text Up -command [list [self] upWindow]
    pack $win.upbutton -anchor w -side top -before $win.listbox
}
