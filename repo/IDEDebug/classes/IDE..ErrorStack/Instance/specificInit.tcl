IDE::ErrorStack instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical
    frame $win.lowerframe

    IDE::StackMethodListView create [self]::methodlist $win.methodlist

    button $win.lowerframe.errorInfo -command [list [self] showErrorInfo] -text errorInfo
    IDE::TclModeEdit create [self]::methodedit $win.lowerframe.methodedit -mixin IDE::CodeController
    pack $win.lowerframe.errorInfo -anchor w
    pack $win.lowerframe.methodedit -expand yes -fill both

    $win.panedwindow add $win.methodlist -sticky news -height 120
    $win.panedwindow add $win.lowerframe -sticky news -height 300

    pack $win.panedwindow -expand yes -fill both

    bind $win <Alt-n> [list [self]::methodlist next]
    bind $win <Alt-p> [list [self]::methodlist prev]

    my initStatusBar -1
    next
}
