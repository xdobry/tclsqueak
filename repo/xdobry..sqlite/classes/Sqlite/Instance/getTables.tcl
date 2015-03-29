Sqlite instproc getTables {} {
    my queryList "select name from sqlite_master where type = 'table'"
}
