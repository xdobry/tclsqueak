IDE::ListView instproc addItemAt {item pos} {
    # add Item at position 0 - end
    my instvar win listItems
    set listItems [linsert $listItems $pos $item]
    $win.listbox insert $pos $item
    my set selectedIndex -1
}
