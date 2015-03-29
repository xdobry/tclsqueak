IDE::ListView instproc selectNextItem {} {
    my instvar win
    set cur [$win.listbox curselection]
    if { [llength $cur] > 1 } {
        set cur [lindex $cur 0]
    }
    if { $cur < [$win.listbox index end] } {
        my setSelectedIndex [expr {$cur+1}]
    }
}
