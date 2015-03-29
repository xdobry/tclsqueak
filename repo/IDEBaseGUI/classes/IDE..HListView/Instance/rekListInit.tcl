IDE::HListView instproc rekListInit {hlist deep} {
    my instvar listItems
    #[self] halt
    lappend listItems "$deep[string trimleft [lindex $hlist 0] :]"
    foreach subtree [lrange $hlist 1 end] {
        my rekListInit $subtree "$deep  "
    }
}
