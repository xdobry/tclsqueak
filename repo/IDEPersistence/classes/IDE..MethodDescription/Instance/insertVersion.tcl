IDE::MethodDescription instproc insertVersion {} {
    my instvar basedon methodid
    set basedon {}
    my makePersistent
    [my getPersistenceManager] addRelationship [my getObjectDescription] [self]
}
