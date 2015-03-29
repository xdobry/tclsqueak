IDE::ObjectDescription instproc getAvailable {} {
    #show all available method (proc and instproc) for this object
    if {[self calledclass] eq ""} { next } else {
         [IDE::DBPersistence getPersistenceManager] getAvailableMethodsForObject [my getObjectName]
    }
}
