IDE::MetakitPersistenceManager instproc selectSubobjectsBase {desc id relcols subcols} {
    set relation [$desc set weakRelationship]
    set subdesc [$relation targetClass]::descriptor
    set rows [list]
    set db [my getMetakitHandle]
    if {[$relation exists orderIndexName]} {
        set iset [mk::select $db.[$desc table]!$id.[$relation relationTable] -sort [$relation orderIndexName]]
    } else {
        set iset [mk::select $db.[$desc table]!$id.[$relation relationTable]]
    }
    foreach cid $iset {
        set row [eval mk::get $db.[$desc table]!$id.[$relation relationTable]!$cid  [$relation targetName] $relcols]
        set sid [lindex $row 0]
        set row [lrange $row 1 end]
        set row [concat $row [eval mk::get $db.[$subdesc table]!$sid $subcols]]
        lappend rows $row
    }
    return $rows
}
