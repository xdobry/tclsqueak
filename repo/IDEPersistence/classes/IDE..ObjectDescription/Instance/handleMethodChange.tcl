IDE::ObjectDescription instproc handleMethodChange {mobj class methodid} {
    my instvar objectid
    if {[Object isobject $mobj]} {
        # load another Version of method , change Relationships
        set ret [$mobj makeTransistent]
        if {[my returnAffectedRows] && $ret!=1} {
            IDE::Dialog message "DB Warning! Repository is not consistent with client. Probably another user have changed the method first. The operation have no effect in version control system!"
            return
        }
        set relation [[my getDescriptor] set weakRelationship]
        [my getPersistenceManager] addRelationshipBase $relation [self] $methodid
        return $mobj
    } else {
        set relation [[my getDescriptor] set weakRelationship]
        [my getPersistenceManager] addRelationshipBase $relation [self] $methodid
        return  [$class create $mobj]
    }
}
