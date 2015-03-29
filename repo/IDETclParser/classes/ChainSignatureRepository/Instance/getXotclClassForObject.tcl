ChainSignatureRepository instproc getXotclClassForObject {object {namespace {}}} {
    my instvar repositoryChain
    foreach r $repositoryChain {
        set desc [$r getXotclClassForObject $object $namespace]
        if {$desc ne ""} {
            return $desc
        }
    }
    return
}
