IDE::SubObjectsView instproc inspectObject {} {
    my instvar introProxy
    set actual [my selectionAsObject]
    if {$actual eq ""} return
    IDE::ObjectBrowser newBrowser $actual $introProxy
}
