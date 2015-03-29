IDE::RepositoryImporter instproc importConfigmap configmapid {
    my instvar exportRepository importRepository
    set confmap [IDE::PersistenceCopy new -volatile -connection $exportRepository -descriptor [my getDesc IDE::ConfigurationMap::descriptor]]
    $confmap importForId $configmapid
    $confmap copyInstanceToDB
    set components [$exportRepository queryList "select componentid,loadorder from ConfigmapComponent where configmapid=$configmapid order by loadorder"]
    set newid [$confmap set newid]
    foreach component $components {
        set componentid [lindex $component 0]
        set loadorder [lindex $component 1]
        set newcompid [my importComponent $componentid]
        if {$newcompid eq ""} {
            continue
        }
        $importRepository insertRow ConfigmapComponent {configmapid componentid loadorder} [list $newid $newcompid $loadorder]
    }
    return $newid
}
