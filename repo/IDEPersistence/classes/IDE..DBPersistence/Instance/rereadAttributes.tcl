IDE::DBPersistence instproc rereadAttributes attrs {
    [my getPersistenceManager] rereadAttributes [self] $attrs
}
