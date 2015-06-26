PrsMarkupVisitor instproc generateClassHierarchy {hierarchyOut repository} {
    my instvar definitions

    my addNavigation $hierarchyOut

    $hierarchyOut puts "<h1>Class Hierarchy</h1>"

    $hierarchyOut puts {<ul class="classHierarchy">}
    set r 0
    foreach d $definitions {
        set type [lindex $d 0 0]
        set defFileName [lindex $d 2]
        if {$type eq "object"} {
             set objectName [lindex $d 0 1]
             if {[$repository isXotclClass $objectName]} {
                 set superclasses [$repository getClassSuperclassesFromFullName $objectName]
                 set objArr($objectName) [list $r $defFileName $superclasses]
                 foreach s $superclasses {
                     lappend superArr($s) $objectName
                 }
             }
        }
        incr r
    }
    # build hierarchy also for classes in core repository
    if {[array exists superArr]} {
        set needMore 1
        set knownObjects [array names objArr]
        lappend knownObjects ::xotcl::Object ::itcl::object
        while {$needMore} {
            set needMore 0
            foreach objectName [array names superArr] {
                if {$objectName ni $knownObjects} {
                    set superclasses [$repository getClassSuperclassesFromFullName $objectName]
                    lappend knownObjects $objectName
                    foreach s $superclasses {
                        lappend superArr($s) $objectName
                        set needMore 1
                    }
                }
            }
        }
    }

    set rootObject ::xotcl::Object
    if {[info exists superArr($rootObject)]} {
        my generateClassHierarchyRek $hierarchyOut $rootObject objArr superArr
    }
    set rootObject ::itcl::object
    if {[info exists superArr($rootObject)]} {
        my generateClassHierarchyRek $hierarchyOut $rootObject objArr superArr
    }
    $hierarchyOut puts {</ul>}

}
