SignatureRepository instproc getXotclClassForObject {object {namespace {}}} {
    my instvar xotclObjectsArr
    set fullName [my getFullObjectName $object $namespace]
    if {![catch {set xotclObjectsArr($fullName)} desc]} {
        return [lindex $desc 0]
    } else {
        return
    }
}
