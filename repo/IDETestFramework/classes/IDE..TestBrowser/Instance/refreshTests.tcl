IDE::TestBrowser instproc refreshTests {} {
    my instvar win testRunner idArr
    unset -nocomplain idArr
    $win.tree delete [$win.tree children {}]
    my initTestCasesList
}
