IDE::EditionsMultiChooser instproc addItems {} {
    set sobj [[self]::@versions getSelectedObjects]
    if {$sobj eq ""} return
    [self]::@adds insertObjectAt $sobj end
    [self]::@names removeObject [my set selectedGroup]
    [self]::@versions setObjectsList {}
}
