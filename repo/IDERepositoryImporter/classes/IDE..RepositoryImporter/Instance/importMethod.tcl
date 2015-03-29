IDE::RepositoryImporter instproc importMethod methodid {
    my instvar exportRepository importRepository
    set method [IDE::PersistenceCopy new -volatile -connection $exportRepository -descriptor [my getDesc IDE::MethodDescription::descriptor]]
    $method importForId $methodid
    $method copyInstanceToDB
    return [$method set newid]
}
