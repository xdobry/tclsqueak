IDE::TclOOIntroProxy instproc getSubclassesDeep cls {
    set subc [info class subclasses $cls]
    set ret $subc
    foreach s $subc {
        lappend ret {*}[my getSubclassesDeep $s]
    }
    return $ret
}
