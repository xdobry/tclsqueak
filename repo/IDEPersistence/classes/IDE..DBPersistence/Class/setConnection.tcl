IDE::DBPersistence proc setConnection conn_object {
    my set connection $conn_object
    if {[$conn_object istype XOMetakit]} {
        my set persistenceManager [IDE::MetakitPersistenceManager new -childof [self] -connection $conn_object]
    } else {
        my set persistenceManager [IDE::SQLPersistenceManager new -childof [self] -connection $conn_object]
    }
}
