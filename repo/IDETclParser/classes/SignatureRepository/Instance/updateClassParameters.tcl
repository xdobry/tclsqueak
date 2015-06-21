SignatureRepository instproc updateClassParameters {class parameters {namespace {}}} {
    my instvar xotclObjectsArr
    set fullName [my getFullObjectNameBase $class $namespace]
    if {![catch {set xotclObjectsArr($fullName)} desc]} {
        lset desc 2 $parameters
        set xotclObjectsArr($fullName) $desc
    } else {
        return
    }
}
