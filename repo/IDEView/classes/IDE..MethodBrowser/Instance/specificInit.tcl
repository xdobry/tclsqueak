IDE::MethodBrowser instproc specificInit {} {
    my instvar win

    if {[IDE::System isDatabase]} {
       set postFix DB
    } else {
       set postFix ""
    }

    panedwindow $win.panedwindow -orient vertical
    IDE::MethodListView${postFix} create [self]::methodlist $win.methodlist
    IDE::TclModeEdit create [self]::methodedit $win.methodedit -mixin IDE::CodeController
    $win.panedwindow add $win.methodlist -sticky news -height 130
    $win.panedwindow add $win.methodedit -sticky news -height 250
    pack $win.panedwindow -expand yes -fill both
    my initStatusBar 2 1
    next
}
