IDE::ListView instproc selectedItem {} {
    # get all selected items
    my instvar win listItems
    if {[set cur [$win.listbox curselection]] ne ""} {
        if {[llength $cur]>1} {
            foreach id $cur {
                lappend ret [lindex $listItems $id]
            }
            return $ret
        } else {
            return [lindex $listItems $cur]
        }
    }
    return {}
}
