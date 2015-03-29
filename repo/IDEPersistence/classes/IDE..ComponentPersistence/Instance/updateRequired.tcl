IDE::ComponentPersistence instproc updateRequired {} {
    my instvar requiredComp componentid
    set dbRequired [IDE::ComponentPersistence readRequiredForId $componentid]
    #puts "RQ $requiredComp $dbRequired"
    set relation [[my getDescriptor] set requireRelationship]
    foreach cr $requiredComp {
        if {$cr ni $dbRequired} {
            [my getPersistenceManager] addRelationshipBase $relation [self] $cr
        }
    }
    foreach cr $dbRequired {
        if {$cr ni $requiredComp} {
            [my getPersistenceManager] deleteRelationshipBase $relation [self] $cr
        }
    }

}
