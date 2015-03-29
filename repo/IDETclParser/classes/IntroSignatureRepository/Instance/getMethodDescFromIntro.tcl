IntroSignatureRepository instproc getMethodDescFromIntro {object type method} {
    #ttc vartype object xotcl ::xotcl::Class
    if {![Object isobject $object]} {
        return
    }
    if {$type eq "inst"} {
        if {![Object isclass $object]} {
            return
        }
        if {[llength [$object info instprocs $method]]==0} {
            return
        }
    } else {
        if {[llength [$object info procs $method]]==0} {
            return
        }
    }
    set argList [$object info ${type}args $method]
    set types [list unknown]
    foreach a $argList {
        if {$a eq "args"} {
            lappend types [list * unknown $a]
        } elseif {[$object info ${type}default $method $a var]} {
            lappend types [list ? unknown $a]
        } else {
            lappend types [list unknown $a]
        }
    }
    list [list $object ${type}proc $method] $types
}
