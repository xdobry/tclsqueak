IDE::DBPersistence instproc setMaxIdForMyName {} {
    set des [my getDescriptor]
    my set [$des idColumn] [[my getPersistenceManager] queryMaxId [self]]
}
