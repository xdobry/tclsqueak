IDE::PersistenceManager instproc getSubobjectIndexes obj {
    set desc [$obj getDescriptor]
    set id [$obj getIdValue]
    my getSubobjectIndexesForId $desc $id
}
