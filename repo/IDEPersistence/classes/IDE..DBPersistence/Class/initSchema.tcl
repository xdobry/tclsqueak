IDE::DBPersistence proc initSchema {} {
    foreach cl [my persistenceClasses] {$cl initDescriptor}
}
