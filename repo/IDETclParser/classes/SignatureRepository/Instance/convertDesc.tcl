SignatureRepository instproc convertDesc desc {
    if {[llength $desc]==2 &&
        [llength [lindex $desc 0]]==1 &&
        [llength [lindex $desc 1]]==1} {
            return $desc
        }
     lassign $desc min max options types subcommands
     if {[llength $subcommands]>0} {
         set ret [list]
         foreach s $subcommands {
             lappend ret [my convertSubcommandDesc $s]
         }
         return $ret
     }
     set rtypes [list]
     if {[llength $types]==0} {
        lappend rtypes unknown
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
        if {[llength $options]>0} {
            lappend rtypes [list ? [concat option $options]]
        }
        lappend rtypes {*}[lrange $types 1 end]
    }
    list $rtypes
}
