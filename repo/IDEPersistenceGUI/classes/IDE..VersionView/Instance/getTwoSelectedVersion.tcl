IDE::VersionView instproc getTwoSelectedVersion {} {
    my instvar idList
    set index [my selectedIndex]
    if {[llength $index]!=2} {
        IDE::Dialog error "You must select two item for this action"
        return
    }
    return [list [lindex $idList [lindex $index 0]] [lindex $idList [lindex $index 1]]]
}
