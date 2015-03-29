proc repobs::getopts {arguments optiondesc} {
    lappend optiondesc {-repodir string}
    set options [dict create]
    for {set oplen 0} {$oplen<[llength $arguments]} {incr oplen} {
        set arg [lindex $arguments $oplen]
        set found 0
        foreach opt $optiondesc {
            if {[lindex $opt 0] eq $arg} {
                if {[llength $opt]==1} {
                    dict set options [lindex $opt 0] 1
                } else {
                    incr oplen
                    dict set options [lindex $opt 0] [lindex $arguments $oplen]
                }
                set found 1
                break
            }
        }
        if {!$found} {
            break
        }
    }
    foreach opt $optiondesc {
        if {[llength $opt]==1 && ![dict exists $options [lindex $opt 0]]} {
            dict set options [lindex $opt 0] 0
        }
    }
    if {![dict exists $options -repodir]} {
        dict set options -repodir repo
    }
    set repodir [dict get $options -repodir]
    if {![file isdirectory $repodir]} {
        error "can not find repo directory as $repodir. You may also use option -repodir dir"
    }
    list $options [lrange $arguments $oplen end]
}
