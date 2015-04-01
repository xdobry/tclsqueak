PgSql instproc getTables {} {
    my queryList {select relname from pg_class where (relname !~ '^pg_') and (relkind='r') and  (relname !~ '^pga_')}
}
