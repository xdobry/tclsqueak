IDE::ArrayBrowser instproc inspectAsObjectList key {
    my instvar varray
    set list [my varAction set ${varray}($key)]
    set objects [list]
    foreach obj $list {
        if {[Object isobject $obj]} {
            lappend objects $obj
        }
    }
    if {[llength $objects]>0} {
        IDE::ObjectBrowser browseObjectsList $objects
    } else {
        IDE::Dialog message "There are no objects in the list"
    }
}
