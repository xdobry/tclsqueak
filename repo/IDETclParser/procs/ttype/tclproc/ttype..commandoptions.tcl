proc ttype::commandoptions descs {
    set options [list]
    foreach d [lrange $descs 1 end] {
        set firstArgument [lindex $d 1]
        lassign [ttype::getArgDesc $firstArgument] mult type
        if {[lindex $type 0] eq "option"} {
            foreach {opt opttype} [lrange $type 1 end] {
                lappend options $opt
            }
        }
    }
    return $options
}
