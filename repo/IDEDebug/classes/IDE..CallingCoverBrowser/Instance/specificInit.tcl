IDE::CallingCoverBrowser instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical
    panedwindow $win.upperarea -orient horizontal

    IDE::CoverClassView create [self]::classes $win.upperarea.classes
    IDE::TclModeEdit create [self]::methodedit $win.methodedit
    IDE::MethodCategoryView create [self]::methodcatview $win.upperarea.methodcatview
    IDE::CoverMethodView create [self]::methodview $win.upperarea.methodview

    $win.upperarea add $win.upperarea.classes  -width 200
    $win.upperarea add $win.upperarea.methodcatview -width 240
    $win.upperarea add $win.upperarea.methodview $win.upperarea.methodview -width 200

    $win.panedwindow add $win.upperarea -sticky news -height  220
    $win.panedwindow add $win.methodedit -sticky news -height 200

    pack $win.panedwindow -expand yes -fill both

    IDE::MethodTracker set callingCover 1
    my initStatusBar 2 1

    [self]::classes refreshBaseView
    next
}
