IDE::SQLPersistenceManager instproc getAllObjectNames {} {
    # TODO
    [my getConnection] queryList "SELECT distinct name FROM Object order by name"
}
