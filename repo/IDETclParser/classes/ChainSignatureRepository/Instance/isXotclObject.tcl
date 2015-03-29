ChainSignatureRepository instproc isXotclObject {object {namespace {}}} {
    my instvar repositoryChain
    set oname [my getOriginName $object $namespace]
    if {$oname ne ""} {
        set object $oname
    }
    foreach r $repositoryChain {
        set desc [$r isXotclObject $object $namespace]
        if {$desc} {
            return $desc
        }
    }
    return 0
}
