IDE::HierarchyPanel instproc history {} {
    my instvar hierarchyHistory
    set items [list]
    foreach i $hierarchyHistory {
        lappend items [lindex $i 0]
    }
    if {[llength $items]>0} {
        set idx [IDE::IDialogList getListIndex "hierarchy history" $items]
        if {$idx>=0} {
            my displayHierarchy {*}[lindex $hierarchyHistory $idx]
        }
    }
}
