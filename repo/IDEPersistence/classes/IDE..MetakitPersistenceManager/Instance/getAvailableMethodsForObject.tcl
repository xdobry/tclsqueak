IDE::MetakitPersistenceManager instproc getAvailableMethodsForObject name {
    set db [my getMetakitHandle]
    set names [list]
    foreach id [mk::select $db.Method -exact ObjectName $name] {
        lappend names [mk::get $db.Method!$id name]
    }
    lsort -unique $names
}
