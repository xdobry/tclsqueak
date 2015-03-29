IDE::PersistenceCopy instproc getTargetConnection {} {
     return  [IDE::DBPersistence set connection]
}
