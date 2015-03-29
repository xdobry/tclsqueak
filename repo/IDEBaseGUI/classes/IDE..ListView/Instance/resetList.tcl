IDE::ListView instproc resetList {} {
    my instvar win listItems selectedIndex
    $win.listbox delete 0 end
    set listItems {}
    set selectedIndex -1
}
