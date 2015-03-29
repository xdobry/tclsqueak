IDE::MetakitPersistenceManager instproc queryMaxIdBase {column table name} {
    set db [my getMetakitHandle]
    lindex [mk::select $db.$table -exact name $name] end
}
