IDE::MetakitPersistenceManager instproc addRelationshipVeryBase {relation pdesc pid value {deforder {}}} {
    set db [my getMetakitHandle]
    if {$deforder eq ""} {
        mk::row append $db.[$pdesc table]!$pid.[$relation relationTable] [$relation targetName] $value
    } else {
        mk::row append $db.[$pdesc table]!$pid.[$relation relationTable] [$relation targetName] $value [$relation orderIndexName] $deforder
    }
    [my connection] commit
}
