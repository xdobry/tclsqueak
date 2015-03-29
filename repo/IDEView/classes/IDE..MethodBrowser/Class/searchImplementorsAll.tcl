IDE::MethodBrowser proc searchImplementorsAll {implementor {nocomplain 0}} {
    set list {}
    if {[info procs $implementor] ne ""} {
        lappend list "proc $implementor"
    }
    if {[info procs ::$implementor] ne ""} {
        lappend list "proc $implementor"
    }
    foreach introProxy [IDE::XOIntroProxy getIntroProxies] {
        set prefix [$introProxy getMethodTypePrefix]
        foreach obj [$introProxy getObjects] {
            if {$obj in {xotcl::classInfo xotcl::objectInfo package}} {
                continue
            }
            if {$implementor in [$introProxy getClassMethods $obj]} {
                lappend list "$obj ${prefix}class>$implementor"
            }
        }
        foreach obj [$introProxy getClasses] {
            if {$obj in {xotcl::classInfo xotcl::objectInfo package}} {
                continue
            }
            if {$implementor in [$introProxy getClassMethods $obj]} {
                lappend list "$obj ${prefix}class>$implementor"
            }
            if {$implementor in [$introProxy getInstanceMethods $obj]} {
                lappend list "$obj ${prefix}>$implementor"
            }
        }
        }
    if {[llength $list]>0} {
        my newBrowserList $list $implementor
    } else {
        if {!$nocomplain} {
            my emptySearchResult
        } else {
            return 0
        }
    }
    return 1
}
