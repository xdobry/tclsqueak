IDE::SQLPersistenceManager instproc updateRelationshipOrderBase {relation pdesc pid id deforder} {
    [my getConnection] execute "UPDATE [$relation relationTable] SET [$relation orderIndexName]=$deforder WHERE [$relation sourceName]=$pid and [$relation targetName]=$id"
}
