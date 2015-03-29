IDEFileRepoToSqliteRepo instproc createRepo {pfileRepo sqliteFile} {
    my instvar fileRepo userid timestampFunction connection
    set fileRepo $pfileRepo
    my createOpenDB $sqliteFile
    my createSchema
    $connection openUnitOfWork
    set userid [my insertTable Userlib {name longname} {import import}]
    set timestampFunction [$connection getTimeStampFunction]
    foreach comp [repobs::getAvaialbeComps $fileRepo] {
        my importComponent $comp
    }
    $connection closeUnitOfWork
}
