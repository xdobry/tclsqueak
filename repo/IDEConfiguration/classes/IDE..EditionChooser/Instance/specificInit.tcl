IDE::EditionChooser instproc specificInit {} {
    my instvar win versionsArr
    
    IDE::ListViewEvent create [self]::@versions $win.versions -nameMethod nameVersion -width 40
    
    frame $win.b
    button $win.b.ok -text OK -command [list [self] actionOk]
    button $win.b.cancel -text Cancel -command [list [self] actionCancel]
    
    pack $win.b.ok $win.b.cancel -side left

    [self]::@versions setObjectsList [my versions]
    [self]::@versions setSelectedObject [my selected]
    
    pack $win.versions -fill both -expand yes
    pack $win.b -fill x
    next
}
