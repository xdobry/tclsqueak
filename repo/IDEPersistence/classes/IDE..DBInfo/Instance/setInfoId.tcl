IDE::DBInfo instproc setInfoId infoid {
    if {$infoid eq ""} return
    if {$infoid==0 && [[[my getPersistenceManager] getConnection] istype XOMetakit]} return
    my set infoid $infoid
    my readCommentFromDB
}
