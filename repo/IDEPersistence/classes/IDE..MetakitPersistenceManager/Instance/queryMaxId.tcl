IDE::MetakitPersistenceManager instproc queryMaxId obj {
    set desc [$obj getDescriptor]
    set db [my getMetakitHandle]
    lindex [mk::select $db.[$desc table] -exact name [$obj getName]] end
}
