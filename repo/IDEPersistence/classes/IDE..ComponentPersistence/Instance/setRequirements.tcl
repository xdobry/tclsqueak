IDE::ComponentPersistence instproc setRequirements reqlist {
    my instvar requiredComp
    set requiredComp [list]
    my addRequiredCompList $reqlist
    my updateRequired   
}
