IDE::SQLPersistenceManager instproc queryMaxIdBase {column table name} {
    lindex [[my getConnection] queryList "select max($column) from $table where name='$name'"] 0
}
