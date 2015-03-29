IDE::HListView instproc setList list {
    my instvar win listItems selectedIndex
    $win.listbox delete 0 end
    set listItems $list
    set selectedIndex -1
    $win.listbox insert 0 {*}$listItems
}
