IDE::DBPersistence instproc getValueForColumns cols {
    [my getPersistenceManager] getValueForColumns [self] $cols
}
