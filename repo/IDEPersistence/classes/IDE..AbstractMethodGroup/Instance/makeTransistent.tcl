IDE::AbstractMethodGroup instproc makeTransistent {} {
    [my getPersistenceManager] deleteRelationship [my getComponent] [self]
}
