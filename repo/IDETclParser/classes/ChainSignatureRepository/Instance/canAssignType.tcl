ChainSignatureRepository instproc canAssignType {requiredType isType} {
    my instvar repositoryChain
    if {![PrsCheckerOptions checkTypes]} {
        return 1
    }
    foreach r $repositoryChain {
        set desc [$r canAssignType $requiredType $isType]
        if {$desc} {
            return $desc
        }
    }
    return 0
}
