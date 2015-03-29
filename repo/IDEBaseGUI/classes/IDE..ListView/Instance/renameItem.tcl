IDE::ListView instproc renameItem {item newname} {
    my instvar listItems win
    my removeItem $item
    my addItem $newname
    if {[set cur [lsearch -exact $listItems $newname]]>=0} {
        $win.listbox selection set $cur $cur
        return $cur
    }
    return -1
}
