IDE::VersionTreeView proc showVersionTreeObject name {
    set objects [[IDE::DBPersistence getPersistenceManager] getVersionsForName $name {basedon objectid timest versioninfo isclosed username} IDE::ObjectDescription::descriptor 0]
    my newBrowser [my computeVersionTreeText $objects]
}
