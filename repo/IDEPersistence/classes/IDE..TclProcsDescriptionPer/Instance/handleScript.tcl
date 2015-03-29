IDE::TclProcsDescriptionPer instproc handleScript script {
    if {![[my info parent] questForChange]} return
    next
    if {[my exists methodid]} {
        set ret [my makeTransistent]
        my set basedon [my set methodid]
    } else {
        set ret 1
    }
    my makePersistent
    if {[my returnAffectedRows] && $ret!=1} {
        IDE::Dialog message "DB Warning! Actual version control database is not consistent with client. Probably another user have changed the procedure first. The operation have no effect in version control system! Procedure was saved"
        return
    }
    my updateRelationship
}
