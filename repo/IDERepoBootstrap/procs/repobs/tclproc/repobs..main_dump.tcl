proc repobs::main_dump args {
    lassign [getopts $args {-aspackage -nocomments}] options comps
    foreach c $comps {
        if {[dict get $options -aspackage]} {
            puts -nonewline [getComponentAsPackage $c [dict get $options -repodir] [expr {![dict get $options -nocomments]}]]
        } else {
            puts -nonewline [getComponent $c [dict get $options -repodir] [expr {![dict get $options -nocomments]}]]
        }
    }
}
