IDE::ComponentPersistence instproc updateInsert {} {
    my set basedon {}
    my set userid [my getUserId]
    my makePersistent
    if {[my hasComment]} {[self] makeCommentPersistent}
}
