IDE::DBMapping instproc removeSchema {} {
    set connection [IDE::DBPersistence getConnection]
    if {[lsearch -exact [$connection getTables] [my table]]<0} return
    set sql "DROP TABLE [my table]"
    $connection execute $sql
    if {[my exists relationships]} {
        foreach rel [my set relationships] {
            $rel removeSchema
        }
    }
}
