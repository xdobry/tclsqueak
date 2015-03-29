IDE::TclOOIntroProxy instproc getClasses {} {
    set ret [info class instances oo::class]
    foreach cls [my getSubclassesDeep oo::class] {
        lappend ret {*}[info class instances $cls]
    }
    return $ret
}
