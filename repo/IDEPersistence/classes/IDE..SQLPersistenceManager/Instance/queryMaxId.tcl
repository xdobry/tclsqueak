IDE::SQLPersistenceManager instproc queryMaxId obj {
    set des [$obj getDescriptor]
    lindex [[my getConnection] queryList "select max([$des idColumn]) from [$des table] where name='[$obj getName]'"] 0
}
