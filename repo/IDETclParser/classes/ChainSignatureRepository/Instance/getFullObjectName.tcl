ChainSignatureRepository instproc getFullObjectName {object {namespace {}}} {
    my instvar repositoryChain
    set oname [my getOriginName $object $namespace]
    if {$oname ne ""} {
        set object $oname
    }
    foreach r $repositoryChain {
        set desc [$r getFullObjectName $object $namespace]
        if {$desc ne ""} {
            return $desc
        }
    }
    return
}
