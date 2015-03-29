IDE::MethodListViewDB instproc selectClassTypeMethod {vclass vtype method} {
    next
    my set vclass $vclass
    my set vtype $vtype
    my set method $method
    if {$method eq "" || ![Object isobject $vclass]} return
    set introProxy [my getIntroProxy]
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
