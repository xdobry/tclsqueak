IDE::ComponentSaveWizard instproc specificInit {} {
    my instvar win mode className parameter targetDir type

    my requireNamespace
    set targetDir {}

    frame $win.buttons -relief raised -border 3
    frame $win.lframe
    frame $win.tframe

    ttk::label $win.infolabel -text "Select components to save"

    IDE::NListView create [self]::complist $win.lframe.complist -notify [self] -doubleNotifyProc addItem
    IDE::NListView create [self]::savecomp $win.lframe.savecomp  -notify [self] -doubleNotifyProc delItem

    my set compVisibility [IDE::System isIgnoreIDEComponents]
    ttk::checkbutton $win.lframe.visibility -text "no ide components" -variable [self]::compVisibility -command [list [self] setComponentList]

    ttk::button $win.lframe.addtolist -text < -command [list [self] addToList]
    ttk::button $win.lframe.addalltolist -text << -command [list [self] addAllToList]
    ttk::button $win.lframe.delfromlist -text del -command [list [self] delFromList]

    pack $win.lframe.visibility -side bottom -anchor e
    pack $win.lframe.savecomp -side left -expand yes -fill both
    pack $win.lframe.complist -side right -expand yes -fill both
    pack $win.lframe.addtolist -anchor s -fill x
    pack $win.lframe.addalltolist -anchor s -fill x
    pack $win.lframe.delfromlist -anchor n -fill x

    ttk::label $win.ltarget -text "Target Dir"

    ttk::label $win.tframe.target -border 2 -width 40 -relief sunken -anchor w  -textvariable [self]::targetDir
    ttk::button $win.tframe.change -text "Change" -command [list [self] changeDir]
    pack $win.tframe.target $win.tframe.change -side left


    ttk::button $win.buttons.ok -text Export -command [list [self] actionSave]
    ttk::button $win.buttons.cancel -text Cancel -command [list [self] destroy]
    pack $win.buttons.ok $win.buttons.cancel -side left

    pack $win.infolabel -anchor w
    pack $win.lframe -expand 1 -fill both -pady 10
    pack $win.ltarget -anchor w
    pack $win.tframe -fill x

    if {$type eq "package"} {
        checkbutton $win.nometa -text "no meta data @" -variable [self]::nometa
        checkbutton $win.onefile -text "as one file" -variable [self]::onefile
        checkbutton $win.makepkgindex -text "create pkgIndex" -variable [self]::createPkgIndex
        pack $win.nometa $win.onefile $win.makepkgindex -anchor w
    }
    
    pack $win.buttons -anchor w -ipady 10 -ipadx 6 -fill x

    [self]::savecomp setList {}
    my setComponentList
    next
}
