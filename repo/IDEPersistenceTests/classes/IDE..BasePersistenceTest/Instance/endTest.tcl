IDE::BasePersistenceTest instproc endTest {} {
    my instvar s1 s2
    IDE::SimplePersistenceClass::descriptor removeSchema
    if {[Object isobject s1]} {$s1 destroy}
    if {[Object isobject s2]} {$s2 destroy}
}
