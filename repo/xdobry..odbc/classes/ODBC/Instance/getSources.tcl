ODBC instproc getSources {} {
    set ret [list]
    foreach s [database datasources] {
        lappend ret [lindex $s 0]
    }
    return $ret
}
