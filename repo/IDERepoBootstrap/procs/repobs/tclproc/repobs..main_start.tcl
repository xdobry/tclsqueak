proc repobs::main_start args {
    variable useCompMeta
    lassign [getopts $args {{-require string} {-script string} {-repo string}} 0] options comps
    set repodir [dict get $options -repodir]
    if {[llength $comps]==0} {
        error "no component paramter to start found."
    }
    if {[dict exists $options -require]} {
        foreach r [dict get $options -require] {
            package require {*}$r
        }
    }
    initPackageLoader $repodir
    set libdir [file join [file dirname $repodir] libs]
    if {[file isdirectory $libdir]} {
        lappend ::auto_path $libdir
    }
    set useCompMeta 1
    if {[dict exists $options -repo]} {
        initRepoLoader [dict get $options -repo]
    }
    set i 0
    foreach c $comps {
        if {$c eq "--"} {
            break
        }
        loadComponent $c $repodir
        incr i
    }
    set restArgs [lrange $comps $i+1 end]
    if {[dict exists $options -script]} {
        namespace eval :: [dict get $options -script] $restArgs
    }
}
