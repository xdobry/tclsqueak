IDE::ComponentEdition instproc init compid {
    my instvar componentid objectArr name
    set componentid $compid
    set name [lindex [[IDE::DBPersistence getPersistenceManager] selectExact Component name componentid $compid] 0]

    set rows [[IDE::DBPersistence getPersistenceManager] selectSubobjectsBase IDE::ComponentPersistence::descriptor $componentid objectid {name type}]
    foreach row $rows {
        set objectid [lindex $row 0]
        set oname [lindex $row 1]
        set otype [lindex $row 2]
        set objectArr($oname) [IDE::ObjectEdition new -childof [self] $oname $objectid -type $otype]
    }
}
