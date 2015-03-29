IDE::CommentsContainer proc importProcGroupMeta meta {
    if {[llength $meta]!=6} {
        puts stderr "unexpected length of @ procgroup ..."
        return
    }
    set name [lindex $meta 1]
    set key [lindex $meta 2]
    set type [lindex $meta 3]
    set component [lindex $meta 4]
    set body [lindex $meta 5]
    if {$key ne "idemeta"} {puts stderr "expect @ procgroup name idemeta .. ..."}
    my set proc_groupcomment(${name}_${component}) $body
}
