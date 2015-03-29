IDE::ComponentPersistence proc getAvailable {} {
    [IDE::DBPersistence getPersistenceManager] getAllComponentNames
}
