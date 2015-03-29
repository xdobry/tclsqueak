IDE::DBMapping instproc createInstanceFromDB {class id} {
    my instvar idColumn table
    if {[my cached]} {
        set instance [IDE::ObjectCache getInstance $class $id]
        if {$instance ne ""} {return $instance}
    }
    set cols [my getColumns]
    set result [[IDE::DBPersistence getPersistenceManager] selectExact $table $cols $idColumn $id]
    if {[llength $result]==0} {
        set instance {}
    } else {
        set instance [my initInstance $class $cols $result $id]
    }
    if {[my cached]} {
        IDE::ObjectCache setInstance $instance
    }
    return $instance
}
