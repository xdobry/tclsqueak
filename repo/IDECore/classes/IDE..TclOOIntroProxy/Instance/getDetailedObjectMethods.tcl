IDE::TclOOIntroProxy instproc getDetailedObjectMethods {object visibility hideMixinMethod hideProcsMethod hideNoCmds} {
    set methods [info object methods $object -all]
    set class [info object class $object]
    set smethods {}
    set mixins [info object mixins $object]
    foreach m $methods {
        if {$m in {destroy new create}} continue
        set d [info object call $object $m]
        lassign [lindex $d 0] generalTyp mname dobj mtype
        if {$mtype eq "forward"} {
            continue
        }
        if {$hideProcsMethod && $dobj eq "object"} {
            continue
        }
        if {$hideMixinMethod && $dobj in $mixins} {
            continue
        }
        if {$visibility eq "Class"} {
            if {$dobj eq $class} {
                lappend smethods $m
            }
        } elseif {$visibility eq "MinusRoot"} {
            if {$dobj ne "::oo::object"} {
                lappend smethods [list $m [string trimleft $dobj :]]
            }
        } else {
            lappend smethods [list $m [string trimleft $dobj :]]
        }
    }
    return $smethods
}
