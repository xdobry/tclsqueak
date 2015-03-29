IDE::ObjectDescription proc getAvailable {} {
    [IDE::DBPersistence getPersistenceManager] getAllObjectNames
}
