IDE::PackageLoader instproc specificInit {} {
    my instvar win
    panedwindow $win.upperarea -orient horizontal

    IDE::NListView create [self]::@packages $win.packages -notify [self] -notifyProc selectPackage -label "package"
    IDE::NListView create [self]::@versions $win.versions -label "Version/Kind/Location" -notify [self] -notifyProc selectVersion

    frame $win.buttons
    button $win.buttons.load -text "Import Package" -command [list [self] loadPackage]
    button $win.buttons.loadDirect -text "Load Package without Import" -command [list [self] loadPackageDirect]
    button $win.buttons.loadWS -text "Load into workspace" -command [list [self] loadIntoWorkspace]
    button $win.buttons.searchRequirements -text "Search Requirements" -command [list [self] searchRequirements]
    pack $win.buttons.load $win.buttons.loadDirect $win.buttons.loadWS $win.buttons.searchRequirements -side left

    $win.upperarea add $win.packages -sticky news
    $win.upperarea add $win.versions -sticky news

    pack $win.upperarea -expand yes -fill both
    pack $win.buttons -fill x

    my initPackages
    next
}
