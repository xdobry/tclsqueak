IDE::PersistenceManager instproc deleteRelationship {parentobject obj} {
    set pdesc [$parentobject getDescriptor]
    set pid [$parentobject getIdValue]
    set id [$obj getIdValue]
    set relation [$pdesc set weakRelationship]
    my deleteRelationshipVeryBase $relation $pdesc $pid $id
}
