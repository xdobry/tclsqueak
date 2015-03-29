IDE::ConfigurationMap instproc updateVersion {} {
    my instvar configmapid basedon
    set basedon $configmapid
    my makePersistent
    # we have new id also forgetDBMapping and make new relationship rows
    # in relation-mapping table
    [self]::childconigmaps forgetDBMapping
    [self]::components forgetDBMapping
    [self]::childconigmaps updateList
    [self]::components updateList
}
