IDE::ConfigurationBrowser instproc specificInit {} {
    my instvar win

    panedwindow $win.panedwindow -orient vertical
    frame $win.lframe
    frame $win.bframe
    frame $win.lframe.comp

    IDE::NListView create [self]::confapp $win.lframe.comp.confapp -notify [self] -notifyProc selectComponent -height 1
    IDE::NListView create [self]::appversion $win.lframe.comp.appversion -notify [self] -notifyProc selectCompVersion -height 3
    label $win.lframe.comp.label -text {Versions Options}
    button $win.lframe.comp.checkreq -text {Check Requirements} -command [list [self] checkRequirements]

    pack $win.lframe.comp.confapp -expand yes -fill both
    pack $win.lframe.comp.label -anchor w
    pack $win.lframe.comp.appversion -fill x
    pack $win.lframe.comp.checkreq -anchor w

    IDE::ListView create [self]::applist $win.lframe.classlist

    my set compVisibility [IDE::System isIgnoreIDEComponents]
    checkbutton $win.lframe.visibility -text "no IDE components" -variable [self]::compVisibility -command [list [self] setComponentList]

    button $win.lframe.addtolist -text << -command [list [self] addToList]
    button $win.lframe.delfromlist -text del -command [list [self] delFromList]
    button $win.lframe.upitem -text up -command [list [self] upListElem]
    button $win.lframe.downitem -text down -command [list [self] downListElem]

    IDE::MethodEdit create [self]::configedit $win.cedit -height 1
    IDE::TabButtons create [self]::cbutton $win.cbutton  -states {preStartScript startScript} -command [list [self] changeViewType]

    pack $win.lframe.visibility -side bottom -anchor e
    pack $win.lframe.comp -side left -expand yes -fill both
    pack $win.lframe.classlist -side right -expand yes -fill both
    pack $win.lframe.addtolist -anchor s -fill x
    pack $win.lframe.delfromlist -anchor n -fill x
    pack $win.lframe.upitem -fill x
    pack $win.lframe.downitem -fill x

    pack $win.cedit -expand yes -fill both -in $win.bframe
    pack $win.cbutton -anchor w -in $win.bframe

    $win.panedwindow add $win.lframe -sticky news -height 200
    $win.panedwindow add $win.bframe -sticky news -height 200
    pack $win.panedwindow -expand yes -fill both

    [self]::cbutton setState startScript
    my changeViewType startScript

    my setComponentList
    my initCompList
    next
}
