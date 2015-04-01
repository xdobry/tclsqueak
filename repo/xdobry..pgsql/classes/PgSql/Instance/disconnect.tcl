PgSql instproc disconnect {} {
    my instvar sqlhandle connected
    if {$connected} {
        pg_disconnect $sqlhandle
    }
    set connected 0
}
