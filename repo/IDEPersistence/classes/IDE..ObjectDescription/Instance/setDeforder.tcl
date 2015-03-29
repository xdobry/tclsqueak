IDE::ObjectDescription instproc setDeforder order {
    my set deforder $order
    [my getPersistenceManager] updateRelationshipOrder [my getComponent] [self] $order
}
