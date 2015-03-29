Sqlite instproc getinsertid {} {
    return [[my set sqlhandle] last_insert_rowid]
}
