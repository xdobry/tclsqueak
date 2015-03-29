IDE::ComponentPersistence proc readRequiredForId componentId {
    set desc IDE::ComponentPersistence::descriptor
    set relation [$desc set requireRelationship]
    [IDE::DBPersistence getPersistenceManager] getSubobjectIndexesForIdBase $desc $relation $componentId
}
