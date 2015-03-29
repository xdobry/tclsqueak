IDE::ObjectDescription instproc changeVersionTo objectId {
    next
    [my getComponent] checkRequirementsForClass [my getObject]
}
