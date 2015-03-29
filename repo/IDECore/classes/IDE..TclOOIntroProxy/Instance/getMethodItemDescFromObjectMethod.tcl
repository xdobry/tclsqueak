IDE::TclOOIntroProxy instproc getMethodItemDescFromObjectMethod {object methodWithClass} {
    # used for object browser give the method description as list
    # implementor type name
    # this list can be used in method view as item
    set def [lindex [info object call $object [lindex $methodWithClass 0]] 0]
    lassign $def generalTyp mname dobj mtype
    if {$dobj eq "object"} {
        set type OOClass
    } else {
        set type OOInstance
    }
    list [string trimleft $dobj :] $type $mname
}
