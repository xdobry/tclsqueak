ChainSignatureRepository instproc getClassSuperclassesFromFullName fullName {
    my instvar repositoryChain
    foreach r $repositoryChain {
        set desc [$r getClassSuperclassesFromFullName $fullName]
        if {$desc ne ""} {
            return $desc
        }
    }
    return
}
