SignatureRepository instproc getFullObjectName {object {namespace {}}} {
    my instvar xotclObjectsArr
    set fullName [my getFullObjectNameBase $object $namespace]
    if {[info exists xotclObjectsArr($fullName)]} {
        return $fullName
    } else {
        # search in global namespace in namespace not empty
        if {$namespace ne "" && [string range $object 0 1] ne "::"} {
            set fullName [my getFullObjectNameBase $object {}]
            if {[info exists xotclObjectsArr($fullName)]} {
                return $fullName
            }
        }
        return
    }
}
