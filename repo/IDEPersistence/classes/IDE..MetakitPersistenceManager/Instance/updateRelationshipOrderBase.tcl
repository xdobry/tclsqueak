IDE::MetakitPersistenceManager instproc updateRelationshipOrderBase {relation pdesc pid id deforder} {
    set db [my getMetakitHandle]
    foreach rid [mk::select $db.[$pdesc table]!$pid.[$relation relationTable] -exact [$relation targetName] $id] {
        mk::set $db.[$pdesc table]!$pid.[$relation relationTable]!$rid [$relation orderIndexName] $deforder
        break
    }
}
