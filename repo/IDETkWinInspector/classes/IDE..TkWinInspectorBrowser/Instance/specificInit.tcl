IDE::TkWinInspectorBrowser instproc specificInit {} {
    my instvar win
    panedwindow $win.panedwindow -orient vertical
    panedwindow $win.upperarea -orient horizontal
    IDE::TkWinList create [self]::winlist $win.upperarea.winlist
    IDE::TkWinConfList create [self]::conflist $win.upperarea.conflist
    IDE::MethodEdit create [self]::valuetext $win.valuetext
    
    $win.upperarea add $win.upperarea.winlist $win.upperarea.conflist -width 300
    $win.panedwindow add $win.upperarea -sticky news -height  220
    $win.panedwindow add $win.valuetext -sticky news -height 200
    
    pack $win.panedwindow -fill both -expand yes
    my initStatusBar 0 2
    [self]::winlist selectFor .
}
