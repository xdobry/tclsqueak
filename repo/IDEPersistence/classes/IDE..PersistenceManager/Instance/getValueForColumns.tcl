IDE::PersistenceManager instproc getValueForColumns {obj cols} {
    set des [$obj getDescriptor]
    my selectExact [$des table] $cols [$des idColumn] [$obj getIdValue]
}
