IDE::SubObjectsView instproc selectionAsObject {} {
    my instvar objlist
    set index [my selectedIndex]
    if {$index eq ""} return
    return [lindex $objlist $index]
}
