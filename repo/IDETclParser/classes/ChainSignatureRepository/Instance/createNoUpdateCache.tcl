ChainSignatureRepository instproc createNoUpdateCache {} {
    my instvar repositoryChain noUpdateCache
    set noUpdateCache [list]
    foreach r [lrange $repositoryChain 0 end-1] {
        if {[$r exists methodsArr]} {
            lappend noUpdateCache {*}[$r array names methodsArr]
        }
        if {[$r exists commandsArr]} {
            lappend noUpdateCache {*}[$r array names commandsArr]
        }
    }
    set noUpdateCache [lsort $noUpdateCache]
}
