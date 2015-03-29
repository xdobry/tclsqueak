IDE::TPersistence instproc testWComponentRemove {} {
    if {[[IDE::DBPersistence getConnection] istype XOMetakit]} {
        return
    }
    IDE::ComponentPersistence removeForEver TestCase
    IDE::ComponentPersistence removeForEver TestCase2

    my assert {[llength [IDE::ComponentPersistence getVersionsForName TestCase]]==0}

    [IDE::Component getCompObjectForName TestCase] unload
    [IDE::Component getCompObjectForName TestCase2] unload
}
