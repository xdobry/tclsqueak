IDE::SqlBrowser instproc changeResultShow {} {
    my instvar resultshow win
    if {$resultshow eq "text"} {
        pack forget $win.result.tableframe
        pack $win.result.sqlresult -expand yes -fill both
    } else {
        pack forget $win.result.sqlresult
        pack $win.result.tableframe -expand yes -fill both
    }
}
