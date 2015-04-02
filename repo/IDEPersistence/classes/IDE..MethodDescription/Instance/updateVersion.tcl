IDE::MethodDescription instproc updateVersion {} {
    my instvar methodid basedon
    set basedon $methodid
    set ret [my makeTransistent]
    my makePersistent
    if {[my returnAffectedRows] && $ret!=1} {
        IDE::Dialog message "DB Warning! Repository is not consistent with client. Probably another user have changed the method first. The operation have no effect in version control system! The method body was saved!"
        return
    }
    [my getPersistenceManager] addRelationship [my getObjectDescription] [self]
}
