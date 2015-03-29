IDE::MethodViewDB instproc selectItem method {
    next
    my instvar vclass vtype
    if {$method eq ""} return
    set introProxy [my getIntroProxy]
    if {![$introProxy isObject $vclass]} return
    set des [$introProxy getDescriptionForObject $vclass]
    if {$des ne ""} {
        if {[$des istype IDE::ProcsGroup]} {
            set mobj [$des getProcObjForNameIfExist $method]
            if {$mobj ne "" && [$mobj isPersistent]} {
                [my info parent] setStatusBarText [$mobj printString]
            }
        } else {
            if {$vtype eq "Class"} {
                set mobj [$des getClassMethodObjName $method]
            } else {
                set mobj [$des getInstanceMethodObjName $method]
            }
            if {[Object isobject $mobj]} {
                [my info parent] setStatusBarText [$mobj printString]
            }
        }
    }
}
