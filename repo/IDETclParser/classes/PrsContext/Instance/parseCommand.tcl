PrsContext instproc parseCommand {} {
    # !!! no base list consistency check
    my instvar errors parser isTclGlobalScript rootCommand object name isInstproc

    set isTclGlobalScript 0

    if {![my parseShallow]} {
        # for TclOO it is ok
        # tlog::warn "parseShallow failed [$rootCommand prsString]"
        return 0
    }

    if {[$parser catchParseErrors {set ret [my parseBody]}]} {
        return $ret
    } else {
        if {[$parser exists parseErrors]} {
            lappend errors [list 0 1 [$parser set parseErrors]]
        }
        return 0
    }
}
