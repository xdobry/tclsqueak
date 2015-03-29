IDE::InputCache proc loadCache file {
    my instvar cacheArr
    if {[file readable $file]} {
        set in [open $file r]
        set wline ""
        while {[gets $in line]>=0} {
            if {[string index $line 0] eq "#"} continue
            append wline $line \n
            if {[info complete $wline]} {
                set cacheArr([lindex $wline 0]) [lindex $wline 1]; #ttc noerror
                set wline ""
            }
        }
        close $in
    }
}
