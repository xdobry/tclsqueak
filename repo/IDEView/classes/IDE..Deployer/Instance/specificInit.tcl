IDE::Deployer instproc specificInit {} {
    my instvar win mode className parameter targetDir configName nometa onefile isXOTclcode

    my requireNamespace
    set targetDir [pwd]
    set nometa 1
    set onefile 1
    set isXOTclcode 1

    if {![IDE::SystemConfigMap exists configName]} {
        set configName Start.tcl
    } else {
        set configName [IDE::SystemConfigMap set configName].tcl
    }

    frame $win.buttons -relief raised -border 3
    frame $win.lframe
    frame $win.sframe
    frame $win.tframe

    label $win.infolabel -text "Specify deployments options"

    label $win.ltarget -text "Target Dir"
    label $win.tframe.target -border 2 -width 40 -relief sunken -anchor w -textvariable [self]::targetDir
    button $win.tframe.change -text "Change" -command [list [self] changeDir]
    pack $win.tframe.target  -side left -fill x -expand yes
    pack $win.tframe.change -side left

    label $win.sframe.lab -text "Start File"
    entry $win.sframe.target -textvariable [self]::configName
    pack $win.sframe.lab $win.sframe.target -side left

    checkbutton $win.nometa -text "no meta data @ (metadata need XOTcl)" -variable [self]::nometa
    checkbutton $win.onefile -text "as one file" -variable [self]::onefile
    checkbutton $win.nopackages -text "no packages (use source)" -variable [self]::nopackages
    checkbutton $win.isxotclcode -text "Init XOTcl extension" -variable [self]::isXOTclcode

    button $win.buttons.ok -text Generate -command [list [self] actionGenerate]
    button $win.buttons.cancel -text Cancel -command [list [self] destroy]
    pack $win.buttons.ok $win.buttons.cancel -side left

    pack $win.infolabel -anchor w
    pack $win.ltarget -anchor w
    pack $win.tframe -anchor w -fill x
    pack $win.nometa $win.onefile $win.nopackages $win.isxotclcode -anchor w
    pack $win.sframe -anchor w
    pack $win.buttons -anchor w -ipady 10 -ipadx 6 -fill x

    next

    my setIsXOTclCode
}
