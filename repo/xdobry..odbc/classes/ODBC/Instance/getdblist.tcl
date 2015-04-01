ODBC instproc getdblist {} {
    [self] instvar handle
    set ret {}
    foreach tinfo [$handle datasources] {
        lappend ret [lindex $tinfo 0]
    }
    return $ret
}
