IDE::DBMapping instproc createInstancesFromWhere {class colName colValue} {
    my instvar idColumn table idColumn
    set connection [IDE::DBPersistence getConnection]
    set cols [my getColumns]
    set instances {}
    set rows [[IDE::DBPersistence getPersistenceManager] selectAsListWithId $table $cols $idColumn $colName $colValue]
    foreach result $rows {
        set id [lindex $result 0]
        if {[my cached]} {
            set instance [IDE::ObjectCache getInstance $class $id]
            if {$instance eq ""} {
                # !!! the 3 methods can be refactored see also ...FromDB
                set instance [my initInstance $class $cols [lrange $result 1 end] $id]
                IDE::ObjectCache setInstance $instance
            }
        } else {
            set instance [my initInstance $class $cols [lrange $result 1 end] $id]
        }
        lappend instances $instance
    }
    return $instances
}
