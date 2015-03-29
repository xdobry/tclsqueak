IDE::RelationshipProxy instproc insertObjectAt {obj index} {
    my instvar objectList
    my checkIndexList
    set objectList [linsert $objectList $index $obj]
}
