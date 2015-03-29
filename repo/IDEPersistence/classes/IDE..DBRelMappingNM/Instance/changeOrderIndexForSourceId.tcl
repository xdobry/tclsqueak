IDE::DBRelMappingNM instproc changeOrderIndexForSourceId {pkValue index orderValue} {
    [IDE::DBPersistence getPersistenceManager] updateRelationshipOrderBase [self] [my info parent] $pkValue $index $orderValue
}
