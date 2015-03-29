IDE::ListView instproc addItem item {
    # add Item and sort
    my instvar win listItems
    if {![ide::lappendIfNone listItems $item]} return
    set listItems [lsort $listItems]
    $win.listbox insert [lsearch -exact $listItems $item] $item
    my set selectedIndex -1
}
