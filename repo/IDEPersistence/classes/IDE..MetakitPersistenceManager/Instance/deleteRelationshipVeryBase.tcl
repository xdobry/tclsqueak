IDE::MetakitPersistenceManager instproc deleteRelationshipVeryBase {relation pdesc pid value} {
    set db [my getMetakitHandle]
    set path $db.[$pdesc table]!$pid.[$relation relationTable]
    set id [lindex [mk::select $path -exact [$relation targetName] $value] 0]
    if {$id eq ""} {
        return 0
    }
    mk::row delete $path!$id
    [my connection] commit
    return 1
}
