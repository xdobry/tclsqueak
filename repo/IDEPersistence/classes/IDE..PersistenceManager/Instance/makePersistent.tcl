IDE::PersistenceManager instproc makePersistent obj {
    set des [$obj getDescriptor]
    set columns [$des getColumns]
    if {"timestamp" in $columns} {
        my set timestamp fresh-inserted
    }
    set values [$obj getInsertValues columns]
    set keyvalue [[my getConnection] insertRowAutoId [$des table] $columns $values [$des idColumn]]
    $obj set [$des idColumn] $keyvalue
    $des createRelationshipProxies [self]
    next
}
