IDE::SubObjectsView instproc refresh {} {
    my instvar vobject introProxy
    my setHList [lrange [$introProxy getSubobjectsHierarchyForObject $vobject] 1 end]
    my selectItem {}
}
