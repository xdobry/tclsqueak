IDE::SQLPersistenceManager instproc getAditionalInfoForComponentId componentid {
    [my getConnection] queryList "SELECT name,Object.objectid,versioninfo,[IDE::DBPersistence dateFormat timest],type FROM ComponentObject,Object where ComponentObject.componentid=$componentid and ComponentObject.objectid=Object.objectid order by type,name"

}
