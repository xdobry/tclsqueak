Sqlite instproc getColumns table {
    set sql [lindex [lindex [my queryList "select sql from sqlite_master where name='$table'"] 0] 0]
    regexp {\((.+)\)} $sql _ isql
    set columns [list]
    foreach column [my scanCreate $isql] {
        foreach keyvalue $column {
            if {[lindex $keyvalue 0] eq "name"} {
                lappend columns [lindex $keyvalue 1]
                break
            }
        }
    }
    return $columns
}
