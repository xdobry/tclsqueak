IDE::DBPersistence instproc createNewEdition {} {
    my instvar isclosed
    if {![my questForChangeParent]} { return 0 }
    if {$isclosed!=1} {
        error "Can not create new edition from not versioned object [self]"
    } 
    set isclosed 0
    my increaseVersionInfo
    IDE::Transcript warning "new edition of [my getName] was created"
    my updateVersion
    return 1
}
