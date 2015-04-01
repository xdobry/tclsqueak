ODBC::SqlQuery instproc destroy {} {
   [[self] qhandle] drop
}
