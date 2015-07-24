IDE::GlobalVarsInspector instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical
    IDE::GlobalVarsView create [self]::varslist $win.varslist -height 2
    IDE::MethodEdit create [self]::varvalue $win.varvalue -width 70 -height 20
    $win.panedwindow add $win.varslist -sticky news -height 180
    $win.panedwindow add $win.varvalue -sticky news -height 200
    pack $win.panedwindow -expand yes -fill both

    my initStatusBar 2 2
    [self]::varslist refresh
}
