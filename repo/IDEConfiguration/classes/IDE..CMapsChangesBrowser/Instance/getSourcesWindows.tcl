IDE::CMapsChangesBrowser instproc getSourcesWindows fwin {
    IDE::NListView create [self]::components $fwin.components -notify [self] -notifyProc selectComponent
    IDE::NListView create [self]::classes $fwin.classes -notify [self] -notifyProc selectClass
    IDE::NListView create [self]::methods $fwin.methods -notify [self] -notifyProc selectMethod
    return [list $fwin.components $fwin.classes $fwin.methods]
}
