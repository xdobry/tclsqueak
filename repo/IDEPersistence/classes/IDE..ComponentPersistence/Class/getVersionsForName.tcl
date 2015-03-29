IDE::ComponentPersistence proc getVersionsForName name {
    [IDE::DBPersistence getPersistenceManager] getVersionsForName $name {componentid timest versioninfo username} ::IDE::ComponentPersistence::descriptor
}
