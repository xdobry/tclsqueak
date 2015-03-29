IDE::MetakitPersistenceManager instproc getAllObjectNames {} {
    set db [my getMetakitHandle]
    set names [list]
    foreach id [mk::select $db.Object] {
        lappend names [mk::get $db.Object!$id name]
    }
    lsort -unique $names
}
