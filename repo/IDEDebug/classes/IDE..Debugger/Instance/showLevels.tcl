IDE::Debugger instproc showLevels {} {
    my instvar objectList entryLevel levelInfo methodList argumentList
    # access via parameter build in procedure - method is empty
    if {[lindex [info level $entryLevel] 0] eq ""} {
        incr entryLevel -1
    }
    for {set x $entryLevel} {$x>0} {incr x -1} {
        set level [info level $x]
        set method [lindex $level 0]
        set ooexpr {[namespace which self] eq "::oo::Helpers::self" && ![catch self]}
        set isTclOOObject [uplevel #$x [list expr $ooexpr]]
        if {$isTclOOObject} {
            lassign [uplevel #$x {list [self object] [self method] [self call] [info object class [self object]]}] object method call oclass
            lassign [lindex $call 0 0] generalTyp mname class mtype
            #puts "$call $generalTyp $mname class=$class mytype=$mtype"
            if {$class eq "object"} {
                lappend stackList "[string trimleft $object :] ooclass>$method"
            } else {
                if {$class eq $oclass} {
                    lappend stackList "[string trimleft $class :] oo>$method"
                } else {
                    lappend stackList "[string trimleft $class :] oo ([string trimleft $oclass :])>$method"
                }
            }
            lappend objectList $object
        } else {
            set expr "!\[catch self\] && \[self proc\]==\"$method\""
            set isobject [uplevel #$x [list expr $expr]]
            # puts "entryLevel=$entryLevel isobject=$isobject method=$method level=$level x=$x"
            if {$isobject} {
                lassign [uplevel #$x {list [self] [self class] [my info class]}] object class oclass
                #uts "o $object c $class oclass $oclass"
                if {[Object isobject $object]} {
                    if {[Object isclass $object] || $class eq "" || $class eq "{}"} {
                        lappend stackList "[string trimleft $object :] class>$method"
                    } else {
                        if {$class eq $oclass} {
                            lappend stackList "[string trimleft $class :]>$method"
                        } else {
                            lappend stackList "[string trimleft $class :] ([string trimleft $oclass :])>$method"
                        }
                    }
                    lappend objectList $object
                }
            } else {
                # normal tcl proc
                if {$method ne ""} {
                    set methodfull [uplevel #$x [list namespace origin $method]]
                    lappend stackList "proc [string trimleft $methodfull :]"
                    lappend objectList {}
                } else {
                    lappend stackList "unknown"
                    lappend objectList {}
                }
            }
        }
        lappend levelInfo [list $x $method]
        lappend methodList $method
        lappend argumentList [lrange $level 1 end]
    }
    [self]::methodlist setListUnsorted $stackList
    [self]::methodlist setSelectedIndex 0
}
