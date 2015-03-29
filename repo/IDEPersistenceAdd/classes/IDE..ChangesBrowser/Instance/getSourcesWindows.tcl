IDE::ChangesBrowser instproc getSourcesWindows fwin {
    my instvar mode
    if {$mode eq "components"} {
        IDE::NListView create [self]::classes $fwin.classes -notify [self] -notifyProc selectClass
        IDE::NListView create [self]::methods $fwin.methods -notify [self] -notifyProc selectMethod
        return [list $fwin.classes $fwin.methods]
    } elseif {$mode eq "objects"} {
        IDE::NListView create [self]::methods $fwin.methods -notify [self] -notifyProc selectMethod
        return $fwin.methods
    } elseif {$mode eq "methods"} {
        return
    }
    error "wrong mode"
}
