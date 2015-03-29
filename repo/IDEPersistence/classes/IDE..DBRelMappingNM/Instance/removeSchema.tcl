IDE::DBRelMappingNM instproc removeSchema {} {
    set connection [IDE::DBPersistence getConnection]
    if {[lsearch -exact [$connection getTables] [my relationTable]]<0} return
    set sql "DROP TABLE [my relationTable]"
    $connection execute $sql
}
