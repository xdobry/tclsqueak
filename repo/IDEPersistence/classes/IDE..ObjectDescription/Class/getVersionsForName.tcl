IDE::ObjectDescription proc getVersionsForName name {
    [IDE::DBPersistence getPersistenceManager] getVersionsForName $name {objectid timest versioninfo isclosed username} IDE::ObjectDescription::descriptor
}
