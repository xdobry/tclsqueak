IDE::ListView instproc selectPrevItem {} {
    my instvar win
    set cur [$win.listbox curselection]
    if { [llength $cur] > 1 } {
        set cur [lindex $cur 0]
    }
    if { $cur > 0 } {
        my setSelectedIndex [expr {$cur-1}]
    }
}
