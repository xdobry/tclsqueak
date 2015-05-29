IDE::ComponentEdition instproc init compid {
    my instvar componentid objectArr name ootype
    set componentid $compid
    lassign [[IDE::DBPersistence getPersistenceManager] selectExact Component {name ootype} componentid $compid] name ootype

    set rows [[IDE::DBPersistence getPersistenceManager] selectSubobjectsBase IDE::ComponentPersistence::descriptor $componentid objectid {name type}]
    foreach row $rows {
        set objectid [lindex $row 0]
        set oname [lindex $row 1]
        set otype [lindex $row 2]
        set objectArr($oname) [IDE::ObjectEdition new -childof [self] $oname $objectid -type $otype]
    }
}
