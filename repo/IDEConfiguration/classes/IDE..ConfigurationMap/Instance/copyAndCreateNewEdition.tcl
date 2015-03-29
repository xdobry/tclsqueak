IDE::ConfigurationMap instproc copyAndCreateNewEdition {} {
    set inst [Object autoname confmap]
    [self] copy $inst
    $inst createNewEdition
    return $inst
}
