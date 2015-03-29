IDE::AbstractMethodGroup instproc changeVersionTo objectId {
    set ret [my makeTransistent]
    my rereadForAnotherVersion $objectId
    if {[my returnAffectedRows] && $ret!=1} {
        IDE::Dialog message "DB Warning! Actual version control database is not consistent with client. Probably another user have changed the class/object/proc group version im component first. The operation have no effect in version control system!"
        return
    }
    my setRelationshipToComponent
}
