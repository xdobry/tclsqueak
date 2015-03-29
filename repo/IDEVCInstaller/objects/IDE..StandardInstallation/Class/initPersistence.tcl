IDE::StandardInstallation proc initPersistence {} {
    my instvar connection
    set connection [[Sqlinterface loadInterface sqlite] new]
    set repo [file join [IDEPreferences initAndgetPrepDirectory] repository.sql]
    $connection connect [list sqlfile $repo]
    my initTables
    IDE::DBPersistence setConnection $connection
    IDEPreferences setParameter connection [list sqlfile $repo]

}
