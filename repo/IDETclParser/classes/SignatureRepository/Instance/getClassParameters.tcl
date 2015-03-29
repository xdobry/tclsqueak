SignatureRepository instproc getClassParameters {class {namespace {}}} {
    my instvar xotclObjectsArr
    set fullName [my getFullObjectNameBase $class $namespace]
    if {![catch {set xotclObjectsArr($fullName)} desc]} {
        return [lindex $desc 2]
    } else {
        return
    }
}
