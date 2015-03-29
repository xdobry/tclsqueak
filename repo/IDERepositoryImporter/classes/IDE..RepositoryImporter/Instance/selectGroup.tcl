IDE::RepositoryImporter instproc selectGroup item {
    my instvar configmaps_arr
    [self]::configmaps setList $configmaps_arr($item)
}
