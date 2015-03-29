IDE::IDialogListChooser instproc createBaseSubwidgets {} {
    my instvar win
    frame $win.lframe
    IDE::NListView create [self]::@listin $win.lframe.listin  -notify [self] -doubleNotifyProc addItemToList
    IDE::NListView create [self]::@listout $win.lframe.listout  -notify [self] -doubleNotifyProc removeItemFromList
    button $win.lframe.delfromlist -text del -command [list [self] delFromList]
}
