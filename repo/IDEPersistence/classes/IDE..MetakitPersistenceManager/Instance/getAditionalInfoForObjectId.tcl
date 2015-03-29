IDE::MetakitPersistenceManager instproc getAditionalInfoForObjectId objectid {
    set db [my getMetakitHandle]
    join  [mk::get $db.Object!$objectid userid defbody]
}
