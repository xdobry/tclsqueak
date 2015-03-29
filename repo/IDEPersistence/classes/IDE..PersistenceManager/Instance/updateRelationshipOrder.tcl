IDE::PersistenceManager instproc updateRelationshipOrder {parentobject obj deforder} {
    set pdesc [$parentobject getDescriptor]
    set pid [$parentobject getIdValue]
    set id [$obj getIdValue]
    set relation [$pdesc set weakRelationship]
    my updateRelationshipOrderBase $relation $pdesc $pid $id $deforder
}
