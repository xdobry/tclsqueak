ChainSignatureRepository instproc getClassParameters {class {namespace {}}} {
    my instvar repositoryChain
    foreach r $repositoryChain {
        set desc [$r getClassParameters $class $namespace]
        if {$desc ne ""} {
            return $desc
        }
    }
    return
}
