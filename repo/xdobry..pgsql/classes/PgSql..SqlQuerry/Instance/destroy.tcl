PgSql::SqlQuerry instproc destroy {} {
    pg_result [my qhandle] -clear
    next
}
