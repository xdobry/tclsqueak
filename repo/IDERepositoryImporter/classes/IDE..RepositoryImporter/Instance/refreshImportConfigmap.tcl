IDE::RepositoryImporter instproc refreshImportConfigmap {} {
    my instvar exportRepository configmaps_arr
    set configmaps [$exportRepository queryList "select configmapid,name,timest,versioninfo from Configmap"]
    foreach configmap $configmaps {
        set name [lindex $configmap 1]
        ide::addToValueForKey configmaps_arr $name $configmap
    }
    [self]::confgrups setList [lsort [array names configmaps_arr]]
}
