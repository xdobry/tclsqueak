PgSql instproc getColumns table {
    my queryList "select attname from pg_class,pg_attribute where pg_class.relname='$table' and pg_class.oid=pg_attribute.attrelid and attnum>0 order by pg_attribute.attnum"
}
