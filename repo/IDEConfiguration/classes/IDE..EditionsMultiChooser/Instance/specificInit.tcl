IDE::EditionsMultiChooser instproc specificInit {} {
    my instvar win versionsArr
    
    IDE::ListViewEvent create [self]::@names $win.names -nameMethod name -actionHandler [self]
    IDE::ListViewEvent create [self]::@versions $win.versions -nameMethod versionDisplay
    IDE::ListViewEvent create [self]::@adds $win.addslist -nameMethod nameVersion

    button $win.add -text >> -command [list [self] addItems]
    button $win.remove -text << -command [list [self] removeItems]

    [self]::@versions addEventInteres [self] addItems buttonDoublePush
    [self]::@adds addEventInteres [self] removeItems buttonDoublePush
    
    frame $win.b
    button $win.b.ok -text OK -command [list [self] actionOk]
    button $win.b.cancel -text Cancel -command [list [self] actionCancel]
    
    pack $win.b.ok $win.b.cancel -side left

    [self]::@names setObjectsList [my names]
    [self]::@names addEventInteres [self] selectName selectedObject
    array set versionsArr [my versions]
    
    grid $win.names -row 0 -column 0 -sticky news -rowspan 2
    grid $win.versions -row 0 -column 1 -sticky news -rowspan 2
    grid $win.addslist -row 0 -column 3 -sticky news -rowspan 2
    grid $win.add -row 0 -column 2
    grid $win.remove -row 1 -column 2
    grid $win.b -row 2 -column 0 -sticky ew -columnspan 4
    grid rowconfigure $win 0 -weight 1
    grid columnconfigure $win 0 -weight 1
    grid columnconfigure $win 1 -weight 1
    grid columnconfigure $win 3 -weight 1
    next
}
