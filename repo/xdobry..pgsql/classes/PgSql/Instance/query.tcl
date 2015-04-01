PgSql instproc query sqlstatment {
    my instvar sqlhandle
    set qhandle [pg_exec $sqlhandle $sqlstatment]
    #puts "Querry Status [pg_result $qhandle -status]"
    if {[pg_result $qhandle -status] eq "PGRES_FATAL_ERROR"} {
        my errorMessage [pg_result $qhandle -error]
        pg_result $qhandle -clear
        return {}
    }
    PgSql::SqlQuerry new -qhandle $qhandle
}
