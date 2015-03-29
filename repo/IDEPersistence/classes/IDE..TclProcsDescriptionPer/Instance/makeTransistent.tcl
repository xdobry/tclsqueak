IDE::TclProcsDescriptionPer instproc makeTransistent {} {
    [my getPersistenceManager] deleteRelationship [my getObjectDescription] [self]
}
