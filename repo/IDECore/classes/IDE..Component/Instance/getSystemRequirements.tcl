IDE::Component instproc getSystemRequirements {} {
    my instvar ootype classes objects
    set req [list]
    if {$ootype eq "XOTcl" && ([llength $classes]>0 || [llength $objects]>0)} {
        lappend req XOTcl
    } elseif {$ootype eq "TclOO" && ([llength $classes]>0 || [llength $objects]>0)} {
        lappend req TclOO
    }
    return $req
}
