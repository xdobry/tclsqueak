IDE::MethodDescription instproc makeTransistent {} {
    # using Persistence Manager
    [my getPersistenceManager] deleteRelationship [my getObjectDescription] [self]
}
