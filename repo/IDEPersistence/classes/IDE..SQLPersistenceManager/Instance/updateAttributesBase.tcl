IDE::SQLPersistenceManager instproc updateAttributesBase {table idcolumn id updatelist} {
    set updateset ""
    foreach {attr value} $updatelist {
        if {$updateset ne ""} {append updateset ,}
        append updateset "$attr=[my maskstring $value]"
    }
    if {$updateset ne ""} {
        [my getConnection] execute "UPDATE $table SET $updateset WHERE $idcolumn=$id"
    }
}
