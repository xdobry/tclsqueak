IDE::InstallerGUI instproc getSchemaFile {} {
   array set interfaceOpts {mysql schema_mysql.sql
                     postgres schema_postgres.sql
                     tclodbc schema_odbc.sql
                     sqlite schema_sqlite.sql
                     MSAccess schema_access.sql
                     MSSql schema_mssql.sql
                     Oracle schema_oracle.sql
                     Metakit schema_metakit.sql}
   return $interfaceOpts([my set interface])
}
