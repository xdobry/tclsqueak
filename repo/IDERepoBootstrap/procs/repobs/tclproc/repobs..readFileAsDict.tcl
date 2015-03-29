proc repobs::readFileAsDict file {
    set meta [dict create]
    set content ""
    set in [open $file r]
    while {[gets $in line]>=0} {
        if {[string index [string trim $line] 0] eq "#"} {
            continue
        }
        append content $line \n
        if {[info complete $content]} {
            lassign $content key value
            dict set meta $key $value
            set content ""
        }
    }
    close $in
    return $meta
}
