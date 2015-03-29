IDE::IntroProxy proc getSubclassesDeep cls {
    set subc [$cls info subclass]
    set ret $subc
    foreach s $subc {
        lappend ret {*}[my getSubclassesDeep $s]
    }
    return $ret
}
