IDE::Component instproc getObjectDefineList {} {
    set defList [list]
    foreach class [concat [lsort [my getClasses]] [lsort [my getObjects]]] {
        set res [my rekBuildDefList $class $defList]
        if {[llength $res]>0} {
            set defList [concat $defList $res]
        }
    }
    return $defList
}
