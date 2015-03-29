IDE::RepositoryImporter instproc importComponent componentid {
    my instvar exportRepository importRepository ignoreKnownComponents
    set component [IDE::PersistenceCopy new -volatile -connection $exportRepository -descriptor [my getDesc IDE::ComponentPersistence::descriptor]]
    $component importForId $componentid
    if {$ignoreKnownComponents} {
        if {[IDE::Component getCompObjectForNameIfExist [$component set name]] ne ""} {
            return
        }
    }
    $component copyInstanceToDB
    set objects [$exportRepository queryList "select objectid,deforder from ComponentObject where componentid=$componentid order by deforder"]
    set newid [$component set newid]
    foreach object $objects {
        set objectid [lindex $object 0]
        set deforder [lindex $object 1]
        set newobjid [my importObject $objectid]
        $importRepository insertRow ComponentObject {componentid objectid deforder} [list $newid $newobjid $deforder]
    }
    return $newid
}
