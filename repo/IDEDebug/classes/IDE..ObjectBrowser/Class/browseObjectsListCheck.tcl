IDE::ObjectBrowser proc browseObjectsListCheck list {
    set olist {}
    foreach elem $list {
        if {[Object isobject $elem]} {
            lappend olist $elem
        }
    }
    if {$olist eq ""} {
        IDE::Dialog message {The list contains no XOTcl Objects}
    } else {
        my browseObjectsList $list
    }
}
