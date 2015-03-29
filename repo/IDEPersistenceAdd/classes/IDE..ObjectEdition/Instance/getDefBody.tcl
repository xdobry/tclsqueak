IDE::ObjectEdition instproc getDefBody {} {
    my instvar bodyCache objectid
    if {[info exists bodyCache] && $bodyCache ne ""} {
        return $bodyCache
    }
    set bodyCache [lindex [[IDE::DBPersistence getPersistenceManager] selectExact Object defbody objectid $objectid] 0]
    return $bodyCache
}
