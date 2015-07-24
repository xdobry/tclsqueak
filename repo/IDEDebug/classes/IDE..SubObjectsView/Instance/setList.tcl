IDE::SubObjectsView instproc setList list {
    my instvar objlist
    set translist {}
    set objlist {}
    foreach elem $list {
        lappend objlist [string trimleft $elem]
        set pre {}
        regexp { +} $elem pre
        lappend translist "$pre[namespace tail [string trimleft $elem]]"
    }
    next $translist
}
