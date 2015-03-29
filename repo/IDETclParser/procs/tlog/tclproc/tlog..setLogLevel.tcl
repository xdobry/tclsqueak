proc tlog::setLogLevel level {
    set levels {error warn info debug trace}
    set logLevel [lsearch $levels $level]
    if {$logLevel<0} {
         error "unknown log level suported levels are: $levels"
    }
    for {set i 0} {$i<[llength $levels]} {incr i} {
        set levelName [lindex $levels $i]
        if {$i<=$logLevel} {
            proc ::tlog::$levelName {message} "puts \"$levelName: \$message\""
            proc ::tlog::l$levelName {message} "puts \"$levelName: \[uplevel \[list subst \$message\]\]\""
        } else {
            proc ::tlog::$levelName {message} ""
            proc ::tlog::l$levelName {message} ""
        }
    }
}
