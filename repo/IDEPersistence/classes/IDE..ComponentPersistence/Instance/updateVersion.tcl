IDE::ComponentPersistence instproc updateVersion {} {
    my instvar basedon componentid
    set basedon $componentid
    my makePersistent
    # copy object/classes dependiences
    [my getPersistenceManager] copyRelationships [self] $basedon
    # copy requirements
    set desc [my getDescriptor]
    [my getPersistenceManager] copyRelationshipsBase [$desc set requireRelationship] [self] $basedon
    IDE::System refreshComponentView [my getName]
}
