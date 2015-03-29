IDE::AbstractMethodGroup instproc setRelationshipToComponent {} {
    my instvar deforder
    [my getPersistenceManager] addRelationship [my getComponent] [self] $deforder
}
