IDE::ComponentPersistence instproc reorderObjectDefinition {} {
    # das Leben kann schon kompliziert werden
    my instvar defcounter
    set defcounter 0
    set introProxy [my getIntroProxy]
    foreach obj [my getObjectDefineList] {
        set desc [$introProxy getDescriptionForObject $obj]
        $desc setDeforder $defcounter
        incr defcounter
    }
    my updateAttributes defcounter
}
