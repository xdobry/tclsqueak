IDE::DBRelMappingNM instproc getIndexListForSourceId pkValue {
    [IDE::DBPersistence getPersistenceManager] selectAsList [my relationTable] [list [my targetName] [my orderIndexName]] [my sourceName] $pkValue [my orderIndexName]
}
