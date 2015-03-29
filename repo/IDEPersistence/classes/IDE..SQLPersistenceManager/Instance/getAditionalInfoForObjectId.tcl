IDE::SQLPersistenceManager instproc getAditionalInfoForObjectId objectid {
    set retList [[my getConnection] queryList "select objectid,userid,defbody from Object where objectid=$objectid"]
    join [lindex $retList 0]
}
