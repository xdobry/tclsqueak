SignatureRepository instproc mergeDescTypes {istypes newtypes} {
    # is type has return type at index 0
    my instvar linkTypes
    set needUpdate 0
    set mergedTypes [list]
    foreach i $istypes n $newtypes {
        set itype [lindex $i 0]
        set ntype [lindex $n 0]
        set itype0 [lindex $itype 0]
        set ntype0 [lindex $ntype 0]
        # skip mult types (not supported)
        if {$itype0 in {* ? +}} {
            set itype [lindex $i 1]
        }
        if {$ntype0 in {* ? +}} {
            set ntype [lindex $n 1]
        }
        if {$itype0 eq "unknown" && [llength $itype]>1 && $ntype0 eq "unknown" && [llength $ntype]>0 && $ntype ne $itype} {
            lappend linkTypes [list [lindex $itype 1] [lindex $ntype 1]]
        }

        if {$itype0 in {unknown def} && $ntype0 ni {unknown def}} {
            set needUpdate 1
            lappend mergedTypes $n
        } elseif {$itype0 in {xotcl class} && $ntype0 eq $itype0 && [lindex $ntype 1] ne [lindex $itype 1]} {
            set needUpdate 1
            lappend mergedTypes [my mergeOOTypes $i $ntype]
        } else {
            lappend mergedTypes $i
        }
    }
    if {$needUpdate} {
        return $mergedTypes
    } else {
        return
    }
}
