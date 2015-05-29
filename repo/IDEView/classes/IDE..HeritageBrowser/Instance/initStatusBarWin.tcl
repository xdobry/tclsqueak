IDE::HeritageBrowser instproc initStatusBarWin win {
    my instvar statusBarTextWin
    frame $win
    label $win.label -anchor w
    set statusBarTextWin $win.label
    pack $win.label  -side left
}
