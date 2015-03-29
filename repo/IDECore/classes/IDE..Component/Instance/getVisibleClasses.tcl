IDE::Component instproc getVisibleClasses {} {
    my instvar classes
    set ret [my getClasses]
    set introProxy [my getIntroProxy]
    foreach class $classes {
        lappend ret {*}[$introProxy getHeritageFlatForClass $class]
    }
    foreach compName [my getRequiredFor] {
        set cobj [[self class] getCompObjectForNameIfExist $compName]
        if {$cobj ne ""} {
            lappend ret {*}[$cobj getVisibleClasses]
        }
    }
    set ret [ide::lcollect each $ret {string trimleft $each :}]
    return [lsort -unique $ret]
}
