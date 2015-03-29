IDE::SQLPersistenceManager instproc getAllComponentNames {} {
    [my getConnection] queryList "SELECT distinct name FROM Component order by name"
}
