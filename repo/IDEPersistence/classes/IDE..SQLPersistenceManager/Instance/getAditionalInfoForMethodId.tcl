IDE::SQLPersistenceManager instproc getAditionalInfoForMethodId methodid {
    set retList [[my getConnection] queryList "select body from Method where methodid=$methodid"]
    lindex [lindex $retList 0] 0
}
