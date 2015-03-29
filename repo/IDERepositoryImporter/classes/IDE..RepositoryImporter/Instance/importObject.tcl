IDE::RepositoryImporter instproc importObject objectid {
    my instvar exportRepository importRepository
    set object [IDE::PersistenceCopy new -volatile -connection $exportRepository -descriptor [my getDesc IDE::ObjectDescription::descriptor]]
    $object importForId $objectid
    $object copyInstanceToDB
    set methods [$exportRepository queryList "select methodid from ObjectMethod where objectid=$objectid"]
    set newid [$object set newid]
    foreach method $methods {
        set methodid [lindex $method 0]
        set newmethodid [my importMethod $methodid]
        $importRepository insertRow ObjectMethod {objectid methodid} [list $newid $newmethodid]
    }
    return $newid
}
