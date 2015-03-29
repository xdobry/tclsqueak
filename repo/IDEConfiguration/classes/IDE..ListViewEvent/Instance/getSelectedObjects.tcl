IDE::ListViewEvent instproc getSelectedObjects {} {
    my instvar objectsList
    set ret {}
    foreach i [my selectedIndex] {
        lappend ret [lindex $objectsList $i]
    }
    return $ret
}
