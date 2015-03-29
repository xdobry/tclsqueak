IDE::DBPersistence instproc updateAttributes attrs {
    [my getPersistenceManager] updateAttributes [self] $attrs
}
