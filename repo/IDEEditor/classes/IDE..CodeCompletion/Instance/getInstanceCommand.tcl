IDE::CodeCompletion instproc getInstanceCommand {pattern contentDesc} {
    lassign $contentDesc class type method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
    set atype [IDE::XOIntroProxy getAbstractMethodType $type]
    if {$atype ni {Class Instance} || ![$introProxy isObject $class]} {
        return
    }
    set mlist [list]
    if {$atype eq "Class"} {
        lappend mlist {*}[my getClassMethods $introProxy $class]
    } else {
        foreach hclass [concat $class [$introProxy getHeritageFlatPrecedenceForClass $class]] {
            lappend mlist {*}[$introProxy getInstanceMethods $hclass]
        }
        if {[$introProxy getOOSystemName] eq "XOTcl"} {
            lappend mlist {*}[::xotcl::Object info instcommands]
        }
        if {[$introProxy getOOSystemName] eq "TclOO"} {
            lappend mlist variable
        }
    }
    set mlist [ide::lselect each $mlist {[string match $pattern $each] && $each ne $pattern}]  
    set mlist [lsort -unique $mlist]
    list $mlist $pattern
}
