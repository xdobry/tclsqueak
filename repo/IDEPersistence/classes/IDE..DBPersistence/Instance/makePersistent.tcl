IDE::DBPersistence instproc makePersistent {} {
    [my getPersistenceManager] makePersistent [self]
    [my getDescriptor] createRelationshipProxies [self]
    next
}
