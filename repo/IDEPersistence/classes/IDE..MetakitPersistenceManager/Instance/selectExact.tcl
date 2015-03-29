IDE::MetakitPersistenceManager instproc selectExact {table cols idName idValue} {
    set db [my getMetakitHandle]
    if {[llength $cols]==1} {
        list [eval mk::get $db.$table!$idValue $cols]
    } else {
        eval mk::get $db.$table!$idValue $cols
    }
}
