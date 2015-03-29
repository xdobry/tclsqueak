ChainSignatureRepository instproc getOriginName {name namespace} {
    my instvar repositoryChain
    foreach r $repositoryChain {
        set oname [$r getOriginName $name $namespace]
        if {$oname ne ""} {
            return $oname
        }
    }
    return
}
