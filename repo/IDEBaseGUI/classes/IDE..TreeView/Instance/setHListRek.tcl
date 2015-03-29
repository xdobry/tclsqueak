IDE::TreeView instproc setHListRek {parentId hlist} {
    my instvar win
    if {[llength $hlist]==0} return
    set twin $win.listbox
    foreach elem $hlist {
        set first [lindex $elem 0]
        set id [my insertForParent $parentId $first]
        my setHListRek $id [lrange $elem 1 end]
    }
}
