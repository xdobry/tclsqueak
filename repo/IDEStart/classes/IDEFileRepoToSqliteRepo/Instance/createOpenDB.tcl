IDEFileRepoToSqliteRepo instproc createOpenDB sqliteFile {
    my instvar connection
    set connection [Sqlite new]
    if {[$connection connect [list sqlfile $sqliteFile]]} {
        error "can not open sqlite"
    }
}
