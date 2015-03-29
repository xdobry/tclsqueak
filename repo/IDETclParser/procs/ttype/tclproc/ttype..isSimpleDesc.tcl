proc ttype::isSimpleDesc descs {
    # simple desciption is list of min und max argument count
    expr {[llength $descs]==2 &&
        [llength [lindex $descs 0]]==1 &&
        [llength [lindex $descs 1]]==1 &&
        [string is integer [lindex $descs 0]] &&
        [string is integer [lindex $descs 1]]}
}
