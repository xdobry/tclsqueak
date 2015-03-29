IDE::ObjectDescription instproc getAdditionalInfo methodId {
    # must get the method body (expected from ChangesBrowser)
    if {[self calledclass] eq ""} { next } else {
        # this method is also used for method compare; do not change
        [my getPersistenceManager] getAditionalInfoForMethodId $methodId
    }
}
