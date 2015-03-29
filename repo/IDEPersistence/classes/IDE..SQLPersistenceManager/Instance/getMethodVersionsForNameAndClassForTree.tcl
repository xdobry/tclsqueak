IDE::SQLPersistenceManager instproc getMethodVersionsForNameAndClassForTree {name classname type} {
    [my getConnection] queryList "select basedon,methodid,[[my getConnection] dateFormat timest],versioninfo,u.name from Method,Userlib u where Method.name='$name' and objectname='$classname' and u.userid=Method.userid and type='$type' order by methodid"
}
