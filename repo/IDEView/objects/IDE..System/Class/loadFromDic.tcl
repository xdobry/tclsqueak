IDE::System proc loadFromDic file {
    set dic [dict create]
    set content ""
    if {[file isfile $file]} {
        set in [open $file r]
        while {[gets $in line]>=0} {
            if {[string index [string trim $line] 0] eq "#"} {
                continue
            }
            append content $line \n
            if {[info complete $content]} {
                lassign $content key value
                dict set dic $key $value
                set content ""
            }
        }
        close $in
    }
    return $dic
}
