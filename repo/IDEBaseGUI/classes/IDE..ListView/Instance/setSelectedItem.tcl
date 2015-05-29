IDE::ListView instproc setSelectedItem {item {notify 1}} {
    my instvar win listItems selectedIndex
    if {[set cur [lsearch -exact $listItems $item]]>=0} {
        my unselect 
        $win.listbox selection set $cur $cur
        $win.listbox see $cur
        set selectedIndex $cur
        if {$notify==1} {
            my selectItem $item
        }
    }
}
