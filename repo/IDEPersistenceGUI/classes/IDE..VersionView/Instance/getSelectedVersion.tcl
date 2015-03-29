IDE::VersionView instproc getSelectedVersion {} {
    my instvar idList
    set index [my selectedIndex]
    if {[llength $index]!=1} {
        IDE::Dialog error "You must select one item for this action"
        return
    }
    if {$index eq ""} return
    return [lindex $idList $index]
}
