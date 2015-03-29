IDE::MetakitPersistenceManager instproc selectAsList {table cols idName idValue {ordercolumn {}}} {
    set db [my getMetakitHandle]
    if {$ordercolumn eq ""} {
        set ids [mk::select $db.$table -exact $idName $idValue]
    } else {
        set ids [mk::select $db.$table -exact $idName $idValue -sort $ordercolumn]
    }
    set rows [list]
    foreach id $ids {
        lappend rows [eval mk::get $db.$table!$idValue $cols]
    }
    return $rows
}
