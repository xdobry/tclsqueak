IDE::InstallerGUI instproc sqlParamGUI args {
    my instvar paramFrame connection win createDB
    set frame $win.inputframe
    set paramFrame [IDEDBConnectFrame new -win $frame.args -connectionObject $connection -connectArgs [IDEPreferences getDBLoginParameters] -writefile 1]
    pack $frame.args
    set createDB 0
    if {[$connection hasfunction createDatabase]} {
        ::checkbutton $frame.createDB -text "create new database" -variable [self]::createDB
        ::pack $frame.createDB
    }
}
