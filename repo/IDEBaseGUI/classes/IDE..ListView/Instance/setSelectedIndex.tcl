IDE::ListView instproc setSelectedIndex {cur {notify 1}} {
    my instvar win listItems selectedIndex
    if {$cur<[llength $listItems]} {
        my unselect
        $win.listbox selection set $cur $cur
        $win.listbox see $cur
        set selectedIndex $cur
        if {$notify} {
            my selectItem [lindex $listItems $cur]
        }
    }
}
