Sqlinterface proc getInterfaces {} {
   # name
    return {
        {mysql MySql xdobry::mysql mysqltcl}
        {ODBC ODBC xdobry::odbc tclodbc}
        {postgres PgSql xdobry::pgsql Pgtcl}
        {sqlite Sqlite xdobry::sqlite sqlite}
        {sqlite Sqlite xdobry::sqlite sqlite3}
        {MSAccess ODBCAccess xdobry::access tclodbc}
        {MSSql ODBCMSSql xdobry::mssql tclodbc}
        {Oracle ORATcl xdobry::oratcl Oratcl}
        {Metakit XOMetakit xometakit Mk4tcl}
    }
}
