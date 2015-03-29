IDE::TPersistence instproc testZARowCountsCheck {} {
    my instvar countComponent countComponentObject countObject countObjectMethod countMethod countInfo
    if {[[IDE::DBPersistence getConnection] istype XOMetakit]} {
        return
    }
    set query "SELECT count(*) from Component"
    if {$countComponent!=[lindex [IDE::DBPersistence queryAsList $query] 0]} {
         error {wrong Component count}
    }

    set query "SELECT count(*) from ComponentObject"
    if {$countComponentObject!=[lindex [IDE::DBPersistence queryAsList $query] 0]} {
         error {wrong ComponentObject count}
    }

    set query "SELECT count(*) from Object"
    if {$countObject!=[lindex [IDE::DBPersistence queryAsList $query] 0]} {
          error {wrong Object count}
    }

    set query "SELECT count(*) from ObjectMethod"
    if {$countObjectMethod!=[lindex [IDE::DBPersistence queryAsList $query] 0]} {
         error {wrong ObjectMethod count}
    }

    set query "SELECT count(*) from Method"
    if {$countMethod!=[lindex [IDE::DBPersistence queryAsList $query] 0]} {
         error "wrong Method count old=$countMethod"
    }

    set query "SELECT count(*) from Info"
    if {$countInfo!=[lindex [IDE::DBPersistence queryAsList $query] 0]} {
         error {wrong Info count}
    }

}
