SignatureRepository instproc getMethodDescriptionForObject {object method {namespace {}}} {
    my instvar methodsArr
    set fname [list [my getFullObjectName $object $namespace] proc $method]
    set desc [my getMethodDescription $fname]
    #puts "getMethodDescription $object $method = desc $desc"
    if {$desc ne ""} {
        return $desc
    }
    set desc [my getMethodDescFromIntro $object {} $method]
    if {$desc ne ""} {
        return $desc
    }
    my getMethodDescriptionForClasses [list [my getXotclClassForObject $object]] $method $namespace [my getFullObjectName $object $namespace]
}
