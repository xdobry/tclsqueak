IDE::SqlBrowser instproc clearTable {} {
    my instvar win
    $win.result.table configure -rows 0 -cols 0
    $win.result.table configure -titlerows 0
}
