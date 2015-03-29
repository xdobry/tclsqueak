IDE::MetakitPersistenceManager instproc getSubobjectIndexesForIdBase {desc relation id} {
    set db [my getMetakitHandle]
    set ret [list]
    foreach sid [mk::select $db.[$desc table]!$id.[$relation relationTable]] {
        lappend ret [mk::get $db.[$desc table]!$id.[$relation relationTable]!$sid [$relation targetName]]
    }
    return $ret
}
