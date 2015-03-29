IDE::PersistenceManager instproc deleteRelationshipBase {relation parentobject value} {
    set pdesc [$parentobject getDescriptor]
    set pid [$parentobject getIdValue]
    my deleteRelationshipVeryBase $relation $pdesc $pid $value
}
