IDE::PersistenceManager instproc addRelationship {parentobject obj {deforder {}}} {
    set pdesc [$parentobject getDescriptor]
    set pid [$parentobject getIdValue]
    set id [$obj getIdValue]
    set relation [$pdesc set weakRelationship]
    my addRelationshipVeryBase $relation $pdesc $pid $id $deforder
}
