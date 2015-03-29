IDE::CommentsContainer proc importProcMeta meta {
    if {[llength $meta]<5} {
        puts stderr "unexpected length of @ proc ..."
        return
    }
    set name [lindex $meta 1]
    set key [lindex $meta 2]
    set type [lindex $meta 3]
    if {$key ne "idemeta"} {puts stderr "expect @ proc name idemeta .. ..."}
    if {$type eq "struct"} {
        my set proc_method($name) [lrange $meta 4 end]
    } elseif {$type eq "comment"} {
        my set proc_comment($name) [lrange $meta 4 end]
    } else {
        puts stderr "unexpected @ proc name idemeta $type"
    }
}
