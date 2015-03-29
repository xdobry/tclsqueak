IDE::RepositoryImporter instproc specificInit {} {
    my instvar win ignoreKnownComponents
    my requireNamespace
    frame $win.connectframe
    button $win.connect -command [list [self] connectRepository] -text "Connect Repository"
    label $win.connectionlab
    button $win.disconnect -command [list [self] disconnectRepository] -text "Disonnect Repository"
    IDE::NListView create [self]::confgrups $win.groups -notify [self] -notifyProc selectGroup -height 15
    IDE::ListView create [self]::configmaps $win.configmap -height 15 -width 40
    checkbutton $win.ignorecomponents -text "Ignore known components" -variable [self]::ignoreKnownComponents
    button $win.import -command [list [self] importRepository] -text "Import"
    pack $win.connect $win.disconnect $win.connectionlab -side left -in $win.connectframe
    pack $win.connectframe -side top -anchor w
    pack $win.import -anchor w -side bottom
    pack $win.ignorecomponents -anchor w -side bottom
    pack $win.groups $win.configmap -side left -expand yes -fill both
    next
}
