IDE::DBRelMappingNM instproc checkSchema {} {
    set connection [IDE::DBPersistence getConnection]
    if {[lsearch -exact [$connection getTables] [my relationTable]]>=0} return
    set sql "CREATE TABLE [my relationTable] (
    [my sourceName] int NOT NULL,
    [my targetName] int NOT NULL,
    [my  orderIndexName] float,
    PRIMARY KEY ([my sourceName],[my targetName]) )"
    $connection execute $sql
}
