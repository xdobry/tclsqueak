IDE::ComponentPersistence instproc installObject obj {
    my instvar componentid defcounter
    # object has already a desription. It is in database
    set introProxy [my getIntroProxy]
    set dobj [$introProxy getDescriptionForObject $obj]
    $dobj set deforder $defcounter
    $dobj set userid [my getUserId]
    $dobj setRelationshipToComponent
    incr defcounter
    my updateAttributes defcounter
}
