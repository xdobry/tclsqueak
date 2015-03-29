IDE::PersistenceManager instproc getSubobjectIndexesForId {desc id} {
    set relation [$desc set weakRelationship]
    my getSubobjectIndexesForIdBase $desc $relation $id
}
