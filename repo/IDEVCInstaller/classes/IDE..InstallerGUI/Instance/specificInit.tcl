IDE::InstallerGUI instproc specificInit {} {
    [self] instvar win
    if {$win eq "."} {set win {}}
    IDE::Text [self]::info $win.info -width 50 -height 20
    [[self]::info getTextWindow] configure -wrap word
    IDE::WorkStatus [self]::status $win.status
    frame $win.inputframe
    if {$win eq ".i"} {
        wm protocol [winfo toplevel $win] WM_DELETE_WINDOW {}
    }
    button $win.next -text Next -command [list [self] doNext]
    button $win.cancel -text Cancel -command [list [self] doCancel]

    grid $win.info -row 0 -column 0 -sticky news
    grid $win.inputframe -row 0 -column 1 -columnspan 2
    grid $win.status -row 1 -column 0
    grid $win.next -row 1 -column 1
    grid $win.cancel -row 1 -column 2
    grid rowconfigure $win 0 -weight 1
    grid columnconfigure $win 0 -weight 1
}
