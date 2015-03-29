SignatureRepository instproc getFullHeritageReq class {
    my instvar xotclObjectsArr
    set hlist [list $class]
    if {![catch {set xotclObjectsArr($class)} desc]} {
        set superclases [lindex $desc 1]
        foreach s $superclases {
            if {$s ni $hlist} {
                lappend hlist $s
                foreach c [my getFullHeritageReq $s] {
                    if {$c ni $hlist} {
                        lappend hlist $c
                    }
                }
            }
        }
    }
    return $hlist
}
