IDE::DBPersistence instproc getTimeStamp {} {
    my set timestamp fresh-inserted
    [my getConnection] getTimeStampFunction
}
