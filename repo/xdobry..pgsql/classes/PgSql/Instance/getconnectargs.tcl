PgSql instproc getconnectargs {} {
    global env
    my instvar dbank
    foreach arg [pg_conndefaults] {
        if {[lindex $arg 0] eq "password"} {
            lappend connlist [list [lindex $arg 0] password [lindex $arg 4]]
        } else {
            lappend connlist [list [lindex $arg 0] text [lindex $arg 4]]
            if {[lindex $arg 0] eq "dbname"} {
                set dbank [lindex $arg 4]
            }
        }
    }
    return $connlist
}
