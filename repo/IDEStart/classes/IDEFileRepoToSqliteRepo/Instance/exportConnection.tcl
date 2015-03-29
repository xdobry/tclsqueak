IDEFileRepoToSqliteRepo instproc exportConnection {} {
    my instvar connection
    set c $connection
    unset connection
    return $c
}
