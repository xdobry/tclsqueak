Sqlite instproc openUnitOfWork {} {
    my execute "BEGIN TRANSACTION"
}
