IDE::ListView instproc setSelectedIndex {cur {notify 1}} {
    my instvar win listItems
    if {$cur<[llength $listItems]} {
        my unselect
        $win.listbox selection set $cur $cur
        $win.listbox see $cur
        if {$notify} {
            my selectItem [lindex $listItems $cur]
        }
    }
}
