Sqlite instproc extract_table {visitor table} {
    set sql [lindex [lindex [my queryList "select sql from sqlite_master where name='$table'"] 0] 0]
    regexp {\((.+)\)} $sql _ isql
    foreach column [my scanCreate $isql] {
      	$visitor newattribute $column
    }
}
