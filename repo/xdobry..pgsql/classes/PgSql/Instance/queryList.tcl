PgSql instproc queryList sqlstatement {
    my instvar sqlhandle error_msg
    set qhandle [pg_exec $sqlhandle $sqlstatement]
    if {[pg_result $qhandle -status] eq "PGRES_FATAL_ERROR"} {
        my errorMessage [pg_result $qhandle -error]
        pg_result $qhandle -clear
        return {}
    }
    set rows {}
    set numTuples [pg_result $qhandle -numTuples]
    for {set x 0} {$x<$numTuples} {incr x} {
        lappend rows [pg_result $qhandle -getTuple $x]
    }
    #pg_result $qhandle -list rows
    pg_result $qhandle -clear
    return $rows
}
