Sqlite instproc closeUnitOfWork {} {
    my execute "END TRANSACTION"
}
