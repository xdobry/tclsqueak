proc repobs::main_start args {
    lassign [getopts $args {{-require string} {-script string}}] options comps
    set repodir [dict get $options -repodir]
    if {[llength $comps]==0} {
        error "no component paramter to start found."
    }
    if {[dict exists $options -require]} {
        foreach r [dict get $options -require] {
            package require {*}$r
        }
    }
    foreach c $comps {
        loadComponent $c $repodir
    }
    if {[dict exists $options -script]} {
        namespace eval :: [dict get $options -script]
    }
}
