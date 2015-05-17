IDE::VersionBrowser instproc specificInit {} {
    my instvar win type geometry vobject name

    if {$type eq "available"} {
        ttk::panedwindow $win.rightarea -orient horizontal
        ttk::panedwindow $win.leftarea -orient vertical
        IDE::VersionView create [self]::version $win.version -multiselect 1
        IDE::AvailableView create [self]::available $win.available
        [self]::available setListUnsorted [$vobject getAvailable]
        IDE::Text [self]::additional $win.additional -width 40 -height 10
    } else {
        ttk::panedwindow $win.leftarea -orient vertical
        IDE::VersionView create [self]::version $win.version -height 6 -multiselect 1
        IDE::Text create [self]::additional $win.additional -width 60 -height 15
        [self]::version selectFor $name
        [self]::version setSelectedIndex 0
    }
    [[self]::additional getTextWindow] configure -takefocus 0

    ttk::frame $win.b
    # make it objectoriented
    set actionLabel [my getActionLabel]
    ttk::button $win.b.load -text $actionLabel -command [list [self] loadVersion] -underline 0
    bind $win <Alt-[string tolower [string index $actionLabel 0]]> [list [self] loadVersion]
    pack $win.b.load -side left
    if {![my hasclass IDE::DialogHelper]} {
        ttk::button $win.b.view -text View -command [list [self] viewEdition]
        ttk::button $win.b.changes -text Changes -command [list [self] viewChanges]
        pack $win.b.view $win.b.changes -side left
    }
    ttk::button $win.b.cancel -text Cancel -command [list [self] destroy] -underline 0
    pack $win.b.cancel -side left

    if {$type eq "available"} {
        $win.leftarea add $win.version
        $win.leftarea add $win.additional
        $win.rightarea add $win.available
        $win.rightarea add $win.leftarea
        pack $win.rightarea -expand yes -fill both
    } else {
        $win.leftarea add $win.version
        $win.leftarea add $win.additional
        pack $win.leftarea -expand yes -fill both
    }
    pack $win.b -fill x -anchor w
    set cancelscript [list [self] destroy]

    bind $win <Escape> $cancelscript
    bind $win <Alt-c> $cancelscript

    next
}
