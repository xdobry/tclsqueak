IDE::DBPersistence instproc getPersistenceManager {} {
    # do not use class method (infinite loop)
    IDE::DBPersistence set persistenceManager
}
