ChainSignatureRepository instproc getMethodDescription fname {
    my instvar repositoryChain
    foreach r $repositoryChain {
        set desc [$r getMethodDescription $fname]
        if {$desc ne ""} {
            return $desc
        }
    }
    return
}
