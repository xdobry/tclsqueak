IDE::IntroProxy proc getBodyClassMethod {obj p} {
    set arguments {}
    foreach arg [$obj info args $p] {
        if {[$obj info default $p $arg val]} {
            # add variables (val)
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    if {$::xotcl::version>=1.3} {
        if {[$obj info nonposargs $p] eq ""} {
            set ret "[string trimleft $obj :] proc [list $p] [list $arguments] \{[$obj info body $p]\}"
        } else {
            set ret "[string trimleft $obj :] proc [list $p] [list [$obj info instnonposargs $p]] [list $arguments] \{[$obj info body $p]\}"
        }
    } else {
        set ret "[string trimleft $obj :] proc [list $p] [list $arguments] \{[$obj info body $p]\}"
    }
    if {[set add [$obj info pre $p]] ne ""} {
        append ret " \{\n"
        foreach ass $add {
            append ret "  [list $ass]\n"
        }
        append ret \}
        set wasPre 1
    } else {
        set wasPre 0
    }
    if {[set add [$obj info post $p]] ne ""} {
        if {$wasPre} {
           append ret " \{\n"
        } else {
           append ret " \{\} \{\n"
        }
        foreach ass $add {
            append ret "  [list $ass]\n"
        }
        append ret \}
    }
    append ret \n
    return $ret}
