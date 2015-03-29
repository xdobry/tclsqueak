IDE::TreeView instproc treeSelect {} {
    my instvar win
    set id [$win.listbox focus]
    if {$id ne ""} {
        my selectItem $id
    }
}
