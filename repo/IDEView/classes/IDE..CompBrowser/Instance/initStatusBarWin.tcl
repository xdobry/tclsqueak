IDE::CompBrowser instproc initStatusBarWin win {
    my instvar statusBarTextWin
    frame $win
    label $win.label -anchor w
    set statusBarTextWin $win.label
    IDE::StateButtonActivity create [self]::stateButton $win.stateBut -states {Source Comment Splited} -command [list [self] changeViewType]
    bind [winfo toplevel $win] <Alt-u> [list $win.stateBut invoke]
    pack $win.label  -side left
    pack $win.stateBut -side right
}
