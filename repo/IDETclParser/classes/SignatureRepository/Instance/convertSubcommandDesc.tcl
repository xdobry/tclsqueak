SignatureRepository instproc convertSubcommandDesc desc {
    set rtypes [list]
    lassign $desc subcommand min max options types subcommands
    if {[llength $types]==0} {
        lappend rtypes unknown
        lappend rtypes [list [list const $subcommand]]
        if {[llength $options]>0} {
            lappend rtypes [list ? [concat option $options]]
        }
        for {set i 0} {$i<$min} {incr i} {
            lappend rtypes unknown
        }
        if {$max<0} {
            lappend rtypes [list * unknown]
        } else {
            for {set i 0} {$i<$max} {incr i} {
                lappend rtypes [list ? unknown]
            }
        }
    } else {
        lappend rtypes [lindex $types 0]
        lappend rtypes [list [list const $subcommand]]
        if {[llength $options]>0} {
            lappend rtypes [list ? [concat option $options]]
        }
        lappend rtypes {*}[lrange $types 1 end]
    }
    return $rtypes
}
