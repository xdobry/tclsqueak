ODBC instproc getColumns table {
    my instvar handle
    set ret {}
    foreach cinfo [$handle columns $table] {
        lappend ret [lindex $cinfo 3]
    }
    return $ret
}
