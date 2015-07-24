IDE::DeployerUI instproc specificInit {} {
    my instvar win type output components histOutputs startScript startScripts
    my requireNamespace
    set nometa 1
    set onefile 1
    my restoreInitSetting

    frame $win.buttons -relief raised -borderwidth 3
    frame $win.cframe
    frame $win.lframe
    frame $win.tframe
    
    ttk::scrollbar $win.cframe.scroll -command "$win.cframe.text yview" -takefocus 0
    text $win.cframe.text -yscrollcommand "$win.cframe.scroll set" -width 30
    pack $win.cframe.scroll -side right -fill y
    pack $win.cframe.text -expand yes -fill both


    ttk::label $win.tframe.ltarget -text [expr {[my isOutputDirectory]?"Target Dir":"Target File"}]
    ttk::combobox $win.tframe.target -textvariable [self]::output -values $histOutputs
    ttk::button $win.tframe.change -text "Browse" -command [list [self] browseOutput]
    pack $win.tframe.ltarget -side left
    pack $win.tframe.target  -side left -fill x -expand yes
    pack $win.tframe.change -side left
    
    if {$type eq "exe"} {
        frame $win.eframe
        ttk::label $win.eframe.ltarget -text "Tclkit Exe"
        label $win.eframe.target -borderwidth 2 -width 40 -relief sunken -anchor w -textvariable [self]::kitexe
        ttk::button $win.eframe.change -text "Browse" -command [list [self] browseKitExe]
        pack $win.eframe.ltarget -side left
        pack $win.eframe.target  -side left -fill x -expand yes
        pack $win.eframe.change -side left
        
    }

    ttk::labelframe $win.sframe -text "Start Script"
    if {[llength $startScripts]>0} {
        ttk::combobox $win.sframe.scripts -values $startScripts
        pack $win.sframe.scripts -anchor w
    } else {
        ttk::label $win.sframe.sinfo -text "You can define class method 'main' or procedure with name 'main_*'\n which are automatically handled as possible entry points"
        pack $win.sframe.sinfo -anchor w
    }
    IDE::Text create [self]::@startScript $win.sframe.startScript -height 3 -width 30
    if {$startScript ne ""} {
        [self]::@startScript setText $startScript
    }
    pack $win.sframe.startScript -fill both -expand yes

    ttk::button $win.buttons.ok -text Deploy -command [list [self] actionGenerate]
    ttk::button $win.buttons.cancel -text Cancel -command [list [self] destroy]
    pack $win.buttons.ok $win.buttons.cancel -side left

    pack $win.cframe -fill both
    pack $win.tframe -anchor w -fill x
    if {$type eq "exe"} {
        pack $win.eframe -anchor w -fill x
    }
    pack $win.sframe -fill both -expand yes
    pack $win.buttons -anchor w -ipady 10 -ipadx 6 -fill x
    

    next

    my initComponents
}
