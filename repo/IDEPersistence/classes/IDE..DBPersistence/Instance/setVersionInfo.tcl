IDE::DBPersistence instproc setVersionInfo newver {
    my instvar versioninfo
    set versioninfo $newver
    my updateAttributes versioninfo
}
