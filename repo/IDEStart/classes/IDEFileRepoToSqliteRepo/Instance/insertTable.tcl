IDEFileRepoToSqliteRepo instproc insertTable {table columns values} {
    my instvar connection
    $connection insertRowAutoId $table $columns $values
}
