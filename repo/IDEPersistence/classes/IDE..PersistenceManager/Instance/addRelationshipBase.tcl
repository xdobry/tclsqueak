IDE::PersistenceManager instproc addRelationshipBase {relation parentobject value} {
    set pdesc [$parentobject getDescriptor]
    set pid [$parentobject getIdValue]
    my addRelationshipVeryBase $relation $pdesc $pid $value
}
