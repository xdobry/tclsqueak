MySql::SqlQuery instproc destroy {} {
    mysqlendquery [my set qhandle]
    next
}
