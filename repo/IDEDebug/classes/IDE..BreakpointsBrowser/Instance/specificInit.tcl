IDE::BreakpointsBrowser instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical

    IDE::BreakpointListView create [self]::blist $win.methodlist
    IDE::TclModeEdit create [self]::methodedit $win.methodedit -mixin IDE::CodeController -height 15 -width 60

    $win.panedwindow add $win.methodlist -sticky news
    $win.panedwindow add $win.methodedit -sticky news

    pack $win.panedwindow -fill both -expand yes

    [self]::blist setEventHandles
    [self]::blist refreshList

    next
}
