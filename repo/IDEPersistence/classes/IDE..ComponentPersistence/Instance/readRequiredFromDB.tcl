IDE::ComponentPersistence instproc readRequiredFromDB {} {
    my instvar requiredComp componentid
    set requiredComp [[self class] readRequiredForId $componentid]
}
