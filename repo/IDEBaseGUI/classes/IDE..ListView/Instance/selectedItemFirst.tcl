IDE::ListView instproc selectedItemFirst {} {
    # get all selected items
    my instvar win listItems
    if {[set cur [$win.listbox curselection]] ne ""} {
        set id [lindex $cur 0]
        return [lindex $listItems $id]
    }
    return {}
}
