ChainSignatureRepository instproc getMethodDescriptionForObject {object method {namespace {}}} {
    my instvar writeRepository repositoryChain
    set fobject [my getFullObjectName $object $namespace]
    set fname [list $fobject proc $method]
    set desc [my getMethodDescription $fname]
    #puts "getMethodDescription $object $method = desc $desc"
    if {$desc ne ""} {
        return $desc
    }
    foreach r $repositoryChain {
        set desc [$r getMethodDescFromIntro $object {} $method]
        if {$desc ne ""} {
            return $desc
        }
    }
    my getMethodDescriptionForClasses [list [my getXotclClassForObject $object]] $method $namespace $fobject
}
