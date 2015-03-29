IDE::ComponentPersistence instproc addClass obj {
    next
    set introProxy [my getIntroProxy]
    if {[$introProxy getDescriptionForObject $obj] eq ""} {
        my registerObject $obj
    } else {
        my installObject $obj
    }
    my checkRequirementsForClass $obj
}
