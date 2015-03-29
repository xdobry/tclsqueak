SignatureRepository instproc mergeTypes {istypes newtypes} {
    my instvar linkTypes
    # is type has return type at index 0
    # new types are only parameter types
    set needUpdate 0
    set mergedTypes $istypes
    foreach ntypeIndex $newtypes {
        lassign $ntypeIndex ntype index
        set i [lindex $istypes $index]
        set itype [lindex $i 0]
        set itype0 [lindex $itype 0]
        # skip mult types (not supported)
        if {$itype0 in {* ? +}} {
            return
        }
        if {$itype0 in {xotcl class}} {
            #my halt
        }
        set ntype0 [lindex $ntype 0]
        if {$itype0 eq "unknown" && [llength $itype]>1 && $ntype0 eq "unknown" && [llength $ntype]>0 && $ntype ne $itype} {
            lappend linkTypes [list [lindex $itype 1] [lindex $ntype 1]]
        }

        if {$itype0 in {unknown def} && $ntype0 ni {unknown def}} {
            set needUpdate 1
            lset mergedTypes $index [list $ntype [lindex $i 1]]
        } elseif {$itype0 in {xotcl class} && $ntype0 eq $itype0 && [lindex $ntype 1] ne [lindex $itype 1]} {
            set needUpdate 1
            lset mergedTypes $index [my mergeOOTypes $i $ntype]
        }
    }
    if {$needUpdate} {
        return $mergedTypes
    } else {
        return
    }
}
