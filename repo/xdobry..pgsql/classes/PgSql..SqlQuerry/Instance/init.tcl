PgSql::SqlQuerry instproc init args {
    next
    my set numTuples [pg_result [my qhandle] -numTuples]
    my set tindex 0
}
