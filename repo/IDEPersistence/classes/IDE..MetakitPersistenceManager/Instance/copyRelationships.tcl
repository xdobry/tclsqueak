IDE::MetakitPersistenceManager instproc copyRelationships {obj basedon} {
    set desc [$obj getDescriptor]
    set id [$obj getIdValue]
    set relation [$desc set weakRelationship]
    set db [my getMetakitHandle]
    foreach eid [mk::select $db.[$desc table]!$basedon.[$relation relationTable]] {
        set row [mk::get $db.[$desc table]!$basedon.[$relation relationTable]!$eid]
        eval mk::row append $db.[$desc table]!$id.[$relation relationTable] $row
    }
    [my connection] commit
}
