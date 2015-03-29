IDE::MethodView instproc selectFor {class categories type {pintroProxy {}}} {
    my instvar vclass vtype vcategories inheritedMethod introProxy
    if {$pintroProxy ne ""} {
        set introProxy $pintroProxy
    } else {
        set introProxy [IDE::XOIntroProxy getIntroProxy]
    }
    if {$class eq ""} {
        my resetList
        set vclass {}
    } elseif {$type eq "Procs"} {
        set cobj [[my info parent] getActualComponentObject]
        set vclass [$cobj getProcsGroupWithName $class]
        if {$vclass eq ""} return
        my setList [$vclass getProcsNames]
    } else {
        if {$categories eq ""} {
            set vclass {}
            my resetList
        } else {
            if {$inheritedMethod && $type eq "Instance"} {
                set inheritedMethods [list]
                set ownMethods [$introProxy getInstanceMethods $class $categories]
                foreach c [lrange [$class info heritage] 0 end-1] {
                    foreach m [$introProxy getInstanceMethods $c $categories] {
                        if {[lsearch $ownMethods $m]!=-1 || [lsearch $inheritedMethods $m]!=-1} continue
                        lappend inheritedMethods $m
                    }
                }
                set allMethods [lsort [concat $ownMethods $inheritedMethods]]
                my setListUnsorted $allMethods
                foreach m $inheritedMethods {
                    my markItemIndexForeGround [lsearch $allMethods $m] darkgreen
                }
            } else {
                my setList [$introProxy get${type}Methods $class $categories]
            }
            set vclass $class
        }
    }
    # mark blue fresh methods (new in this session)
    set vtype $type
    if {$vclass ne ""} {
        set des [$introProxy getDescriptionForObject $vclass]
        if {$des ne ""} {
            set x 0
            foreach method [my getList] {
                if {[$des istype IDE::ProcsGroup]} {
                    set mobj [$des getProcObjForNameIfExist $method]
                    if {$mobj ne "" && [$mobj isPersistent] && [$mobj istFreshInserted]} {
                        my markItemIndexForeGround $x blue
                    }
                } else {
                    if {$vtype eq "Class"} {
                        set mobj [$des getClassMethodObjName $method]
                    } else {
                        set mobj [$des getInstanceMethodObjName $method]
                    }
                    if {[Object isobject $mobj] && [$mobj istFreshInserted]} {
                        my markItemIndexForeGround $x blue
                    }
                }
                incr x
            }
        }
    }
    set vcategories $categories
    my selectItem {}
}
