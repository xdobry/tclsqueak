proc ttype::commandoptionsAll descs {
    # get all possible options not only the first command
    set options [list]
    foreach d [lrange $descs 1 end] {
        foreach arg [lrange $d 1 end] {
            lassign [ttype::getArgDesc $arg] mult type
            if {[lindex $type 0] eq "option"} {
                foreach {opt opttype} [lrange $type 1 end] {
                    lappend options $opt
                }
            }
        }
    }
    return $options
}
