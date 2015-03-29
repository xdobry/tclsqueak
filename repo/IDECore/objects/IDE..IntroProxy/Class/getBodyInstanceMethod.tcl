IDE::IntroProxy proc getBodyInstanceMethod {class p} {
    set arguments {}
    foreach arg [$class info instargs $p] {
        if {[$class info instdefault $p $arg val]} {
            # add variables (val)
            lappend arguments [list $arg $val]
        } else {
            lappend arguments $arg
        }
    }
    if {$::xotcl::version>=1.3} {
        if {[$class info instnonposargs $p] eq ""} {
            set ret "[string trimleft $class :] instproc [list $p] [list $arguments] \{[$class info instbody $p]\}"
        } else {
            set ret "[string trimleft $class :] instproc [list $p] [list [$class info instnonposargs $p]] [list $arguments] \{[$class info instbody $p]\}"
        }
    } else {
        set ret "[string trimleft $class :] instproc [list $p] [list $arguments] \{[$class info instbody $p]\}"
    }
    if {[set add [$class info instpre $p]] ne ""} {
        append ret " \{\n"
        foreach ass $add {
            append ret "  [list $ass]\n"
        }
        append ret \}
    }
    if {[set add [$class info instpost $p]] ne ""} {
        append ret " \{\n"
        foreach ass $add {
            append ret "  [list $ass]\n"
        }
        append ret \}
    }
    append ret \n
    return $ret
}
