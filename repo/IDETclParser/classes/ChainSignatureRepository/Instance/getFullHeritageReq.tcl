ChainSignatureRepository instproc getFullHeritageReq class {
    set hlist [list $class]
    foreach s [my getClassSuperclassesFromFullName $class] {
        if {$s ni $hlist} {
            lappend hlist $s
            foreach c [my getFullHeritageReq $s] {
                if {$c ni $hlist} {
                    lappend hlist $c
                }
            }
        }
    }
    return $hlist
}
