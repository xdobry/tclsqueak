IDE::AbstractMethodGroup instproc updateVersion {} {
    my instvar basedon objectid
    set basedon $objectid
    set ret [my makeTransistent]
    my makePersistent
    [my getPersistenceManager] copyRelationships [self] $basedon
    if {[my returnAffectedRows] && $ret!=1} {
        IDE::Dialog message "DB Warning! Actual version control database is not consistent with client. Probably another user have changed the class/object/proc group version in component first. The operation have no effect in version control system!"
        return
    }
    my setRelationshipToComponent
}
