PrsMarkupVisitor instproc generateSignatures sigOut {
    my instvar fileName definitions
    set r 0
    set dic [dict create]
    foreach d $definitions {
        if {[lindex $d 2] eq $fileName} {
            set type [lindex $d 0 0]
            set defFileName [file tail [lindex $d 2]]
            if {$type eq "proc"} {
                set procname [lindex $d 0 1]
                set ns [namespace qualifiers $procname]
                if {$ns eq ""} {
                    set ns ::
                } else {
                    set ns [string trimleft $ns :]
                }
                set procShort [namespace tail $procname]
                dict set dic $type $ns $procShort [list $r $defFileName $procShort]
            } elseif {$type eq "method"} {
                lassign [lindex $d 0 1] class mtype method
                dict set dic $type $class $mtype $method [list $r $defFileName $method]
            } elseif {$type eq "object"} {
                dict set dic $type [lindex $d 0 1] [list $r $defFileName]
            }
        }
        incr r
    }
    my generateSignaturesFromDic $sigOut $dic
}
