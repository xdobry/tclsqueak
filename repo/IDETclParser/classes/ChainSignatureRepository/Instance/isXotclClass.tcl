ChainSignatureRepository instproc isXotclClass {class {namespace {}}} {
    my instvar repositoryChain
    set oname [my getOriginName $class $namespace]
    if {$oname ne ""} {
        set class $oname
    }
    foreach r $repositoryChain {
        set desc [$r isXotclClass $class $namespace]
        if {$desc} {
            return $desc
        }
    }
    return 0
}
