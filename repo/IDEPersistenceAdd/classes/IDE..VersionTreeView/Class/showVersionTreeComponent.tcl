IDE::VersionTreeView proc showVersionTreeComponent name {
    set comps [[IDE::DBPersistence getPersistenceManager] getVersionsForName $name {basedon componentid timest versioninfo username} ::IDE::ComponentPersistence::descriptor 0]
    my newBrowser [my computeVersionTreeText $comps]
}
