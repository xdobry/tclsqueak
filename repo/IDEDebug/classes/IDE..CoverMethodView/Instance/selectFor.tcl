IDE::CoverMethodView instproc selectFor {class categories type} {
    my instvar vclass vtype vcategories cvtype
    if {$class eq ""} {
        my resetList
        set vclass {}
    } elseif {$type eq "Procs"} {
    } else {
        if {$categories eq ""} {
            set vclass {}
            my resetList
        } else {
            set introProxy [IDE::XOIntroProxy getIntroProxyForObject $class]
            set mlist [$introProxy get${type}Methods $class $categories]
            set tclass [$class]
            set coveredCount 0
            set uncoveredCount 0
            if {[IDE::MethodTracker exists methodCoverArr($tclass)]} {
                set cmethods [IDE::MethodTracker set methodCoverArr($tclass)]
                if {$cvtype eq "Covered"} {
                    set ulist {}
                    set uncoveredCount [llength $mlist]
                    foreach m $cmethods {
                        if {$m in $mlist} {
                            lappend ulist $m
                            incr coveredCount
                            incr uncoveredCount -1
                        }
                    }
                    set mlist $ulist
                } else {
                    set uncoveredCount [llength $mlist]
                    foreach m $cmethods {
                        ide::lremove mlist $m
                        incr uncoveredCount -1
                        incr coveredCount 1
                    }
                }
                my setList $mlist
            } else {
                set uncoveredCount [llength $mlist]
                if {$cvtype eq "Covered"} {
                    my resetList
                } else {
                    my setList $mlist
                }
            }
            set vclass $class
        }
        [self]::stateButton setStateAddInfo Covered $coveredCount
        [self]::stateButton setStateAddInfo "Not Covered" $uncoveredCount
    }
    set vtype $type
    set vcategories $categories
    my selectItem {}
}
