IDE::SQLPersistenceManager instproc getAvailableMethodsForObject name {
    [my getConnection] queryList "select distinct name from Method where ObjectName='$name' order by name"
}
