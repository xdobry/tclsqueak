IDE::TPersistence instproc testBDRowCountsQuery {} {
    my instvar countComponent countComponentObject countObject countObjectMethod countMethod countInfo
    if {[[IDE::DBPersistence getConnection] istype XOMetakit]} {
        return
    }

    set query "SELECT count(*) from Component"
    set countComponent [lindex [IDE::DBPersistence queryAsList $query] 0]

    set query "SELECT count(*) from ComponentObject"
    set countComponentObject [lindex [IDE::DBPersistence queryAsList $query] 0]

    set query "SELECT count(*) from Object"
    set countObject [lindex [IDE::DBPersistence queryAsList $query] 0]

    set query "SELECT count(*) from ObjectMethod"
    set countObjectMethod [lindex [IDE::DBPersistence queryAsList $query] 0]

    set query "SELECT count(*) from Method"
    set countMethod [lindex [IDE::DBPersistence queryAsList $query] 0]

    set query "SELECT count(*) from Info"
    set countInfo [lindex [IDE::DBPersistence queryAsList $query] 0]
}
