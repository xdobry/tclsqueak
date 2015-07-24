IDE::SubObjectsView instproc selectFor {object pintroProxy} {
    my instvar vobject introProxy
    set introProxy $pintroProxy
    set vobject $object
    if {$vobject eq ""} {
        my resetList
        return
    }
    my setHList [lrange [$introProxy getSubobjectsHierarchyForObject $vobject] 1 end]
    my selectItem {}
}
