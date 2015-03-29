IDE::DBRelMappingNM instproc removeIndexForSourceId {pkValue index} {
    [IDE::DBPersistence getPersistenceManager] deleteRelationshipVeryBase [self] [my info parent] $pkValue $index
}
