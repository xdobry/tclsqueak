IDE::ComponentPersistence instproc importAllObjects {} {
    if {![my exists defcounter]} {
        my set defcounter 0
    }
    set introProxy [my getIntroProxy]
    foreach obj [my getObjectDefineList] {
        if {[$introProxy getDescriptionForObject $obj] eq ""} {
            my registerObject $obj
        } else {
            my installObject $obj
        }
    }
    foreach obj [my getProcsGroupsObjects] {
        IDE::ProcsGroupPer installObject $obj
        my installObject $obj
    }
}
