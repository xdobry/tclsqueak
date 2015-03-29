IDE::ComponentPersistence instproc loadAllObjects {} {
    my instvar componentid
    set rows [[my getPersistenceManager] selectSubobjects [self] {objectid deforder} {}]
    set objects [list]
    foreach row $rows {
        set id [lindex $row 0]
        set deforder [lindex $row 1]
        set obj [my loadObject $id]
        lappend objects $obj
        $obj set deforder $deforder
    }
    foreach obj $objects {
        $obj initObject
    }
}
