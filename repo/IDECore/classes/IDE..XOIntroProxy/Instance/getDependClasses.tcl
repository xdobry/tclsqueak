IDE::XOIntroProxy instproc getDependClasses class {
    set dep [$class info subclass]
    foreach cclass [$class info classchildren] {
        if {[Object isclass $cclass]} {
            lappend dep $cclass
        }
    }
    return $dep
}
