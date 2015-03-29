IDE::TreeView instproc insertForParent {parentId id} {
    my instvar win
    $win.listbox insert $parentId end -id $id -text [my getTextForItem $id]
}
