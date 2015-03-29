IDE::SQLPersistenceManager instproc getMethodVersionsForNameAndClass {name classname} {
    [my getConnection] queryList "select methodid,[[my getConnection] dateFormat timest],versioninfo,u.name from Method,Userlib u where Method.name='$name' and objectname='$classname' and u.userid=Method.userid order by timest desc, methodid desc"
}
