IDE::ProcsGroupPer instproc getAvailable {} {
    [IDE::DBPersistence getPersistenceManager] getAvailableMethodsForObject [my getObjectName]
}
