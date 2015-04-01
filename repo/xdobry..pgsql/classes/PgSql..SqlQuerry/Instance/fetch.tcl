PgSql::SqlQuerry instproc fetch {} {
    my instvar qhandle tindex numTuples
    if {$tindex<$numTuples} {
        set result [pg_result $qhandle -getTuple $tindex]
        incr tindex
    } else {
        set result {}
    }
    #puts "fetch $tindex $result"
    return $result
}
