IDE::InstallerGUI instproc setSqlParam args {
    my instvar paramFrame connection
    IDE::DBPersistence setConnection $connection
    IDEPreferences setParameter connection [$paramFrame getConnectArgs]
}
