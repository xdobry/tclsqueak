IDE::TreeView instproc deleteItem id {
    my instvar win
    $win.listbox delete $id
}
