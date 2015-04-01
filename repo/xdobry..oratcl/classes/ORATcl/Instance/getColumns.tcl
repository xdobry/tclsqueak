ORATcl instproc getColumns table {
    my instvar handle
    set ret [list]
    foreach c [oradesc $handle $table] {
        lappend ret [lindex $c 0]
    }
    return $ret
}
