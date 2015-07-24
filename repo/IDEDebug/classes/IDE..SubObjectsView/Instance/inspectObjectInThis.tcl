IDE::SubObjectsView instproc inspectObjectInThis {} {
    my instvar introProxy
    set actual [my selectionAsObject]
    if {$actual eq ""} return
    [my info parent] setViewObject $actual $introProxy
}
