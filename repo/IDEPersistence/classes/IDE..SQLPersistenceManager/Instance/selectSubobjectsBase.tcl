IDE::SQLPersistenceManager instproc selectSubobjectsBase {desc id relcols subcols} {
    set relation [$desc set weakRelationship]
    set subdesc [$relation targetClass]::descriptor
    set acols [list]
    foreach c $relcols {
        lappend acols r.$c
    }
    foreach c $subcols {
        lappend acols s.$c
    }
    set order ""
    if {[$relation exists orderIndexName]} {
        set order " ORDER BY [$relation orderIndexName]"
    }
    [my getConnection] queryList "SELECT [join $acols ,] FROM [$subdesc table] s,[$relation relationTable] r WHERE r.[$relation sourceName]=$id AND s.[$subdesc idColumn]=r.[$relation targetName] $order"
}
