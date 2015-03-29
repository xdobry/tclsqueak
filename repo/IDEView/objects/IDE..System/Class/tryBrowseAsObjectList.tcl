IDE::System proc tryBrowseAsObjectList string {
    if {![info complete $string]} {return 0}
    if {[catch {set len [llength $string]}]} {return 0}
    if {[llength $string]==1} {return 0}
    foreach obj $string {
       if {![Object isobject $obj]} {
           return 0
       }
    }
    IDE::ObjectBrowser browseObjectsList $string
    return 1
}
