IDE::AbstractMethodGroup instproc getVersionsForName name {
    if {[self calledclass] eq ""} { next } else {
        [IDE::DBPersistence getPersistenceManager] getMethodVersionsForNameAndClass $name [my getObjectName]
    }
}
