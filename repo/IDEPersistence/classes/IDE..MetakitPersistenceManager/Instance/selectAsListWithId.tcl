IDE::MetakitPersistenceManager instproc selectAsListWithId {table cols columnId idName idValue {ordercolumn {}}} {
    set db [my getMetakitHandle]
    if {$idName eq ""} {
         set ids [mk::select $db.$table]
    } else {
        if {$ordercolumn eq ""} {
            set ids [mk::select $db.$table -exact $idName $idValue]
        } else {
            set ids [mk::select $db.$table -exact $idName $idValue -sort $ordercolumn]
        }
    }
    set rows [list]
    foreach id $ids {
        set row [concat $id [eval mk::get $db.$table!$id $cols]]
        lappend rows $row
    }
    return $rows
}
