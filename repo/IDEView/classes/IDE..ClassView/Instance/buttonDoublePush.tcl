IDE::ClassView instproc buttonDoublePush {} {
    my instvar win selectedIndex listItems
    set currsel [lindex [$win.listbox curselection] 0]
    if {$currsel ne ""} {
        my selectItem [string trimleft [lindex $listItems $currsel]]
    }
}
