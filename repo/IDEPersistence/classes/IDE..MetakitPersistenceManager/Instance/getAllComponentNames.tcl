IDE::MetakitPersistenceManager instproc getAllComponentNames {} {
    set db [my getMetakitHandle]
    set names [list]
    foreach id [mk::select $db.Component] {
        lappend names [mk::get $db.Component!$id name]
    }
    lsort -unique $names
}
