IDE::ListView instproc addItemAtTail item {
    # add Item 
    my instvar win listItems
    if {![ide::lappendIfNone listItems $item]} return
    $win.listbox insert end $item
    my set selectedIndex -1
}
