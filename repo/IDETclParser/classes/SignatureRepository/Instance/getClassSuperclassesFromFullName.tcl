SignatureRepository instproc getClassSuperclassesFromFullName fullName {
    my instvar xotclObjectsArr
    if {![catch {set xotclObjectsArr($fullName)} desc]} {
        return [lindex $desc 1]
    } else {
        return
    }
}
