IDE::VersionTreeView proc showVersionTreeMethod {name object type} {
    set methods [[IDE::DBPersistence getPersistenceManager] getMethodVersionsForNameAndClassForTree $name $object $type]
    my newBrowser [my computeVersionTreeText $methods]
}
