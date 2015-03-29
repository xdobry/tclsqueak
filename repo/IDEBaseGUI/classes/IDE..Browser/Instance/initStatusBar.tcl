IDE::Browser instproc initStatusBar {y {columns -1}} {
    my instvar win
    my initStatusBarWin $win.statusbar
    if { ($y == -1) || [winfo exists $win.panedwindow]} {
        set fpacked [lindex [pack slaves $win] 0]
        pack $win.statusbar -expand no -fill x -side bottom -before $fpacked
    } else {
        grid $win.statusbar -row $y -columnspan $columns -column 0 -sticky we
    }
}
