IDE::ObjectEdition instproc initMethodsArrays {} {
    my instvar isActual cashInstance cashClass objectid cashInstanceBody cashClassBody
    if {[info exists isActual]} return
    set cashInstance {}
    set cashClass {}
    set rows [[IDE::DBPersistence getPersistenceManager] selectSubobjectsBase IDE::ObjectDescription::descriptor $objectid methodid {name type body}]
    foreach row $rows {
        set methodid [lindex $row 0]
        set name [lindex $row 1]
        set type [lindex $row 2]
        set body [lindex $row 3]
        if {$type eq "tclproc"} {set type Instance}
        lappend cash${type} $name $methodid
        set cash${type}Body($name) $body
    }
    set isActual 1
}
