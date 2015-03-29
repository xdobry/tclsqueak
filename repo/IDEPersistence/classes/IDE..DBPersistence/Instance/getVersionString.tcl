IDE::DBPersistence instproc getVersionString {} {
    my instvar versioninfo timestamp
    if {[info exists versioninfo] && [info exists timestamp]} {
        return "([my getTimeStampString]) $versioninfo"
    }
}
