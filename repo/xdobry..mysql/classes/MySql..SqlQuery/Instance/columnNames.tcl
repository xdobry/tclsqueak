MySql::SqlQuery instproc columnNames {} {
    mysqlcol [my set qhandle] -current name
}
