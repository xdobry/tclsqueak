IDE::TclProcsDescriptionPer instproc updateRelationship {} {
    [my getPersistenceManager] addRelationship [my getObjectDescription] [self]
}
