PrsContext instproc getReturnType {} {
    my instvar parser returnTypes repository forceRetType
    if {[info exists forceRetType]} {
        return $forceRetType
    }
    set unknownType [list unknown [list [my getFullName] 0]]
    set body [$parser root]
    if {[$body exists lastCommand]} {
        set type [my getTypeFromElem [$body set lastCommand]]
        lappend returnTypes $type
    }

    if {[llength $returnTypes]==0} {
        return $unknownType
    }
    set returnTypes [lsort -unique $returnTypes]
    for {set i 0} {$i<[llength $returnTypes]} {incr i} {
        if {[lindex $returnTypes $i 0] eq "unknown" && [llength [lindex $returnTypes $i]]==1} {
            lset returnTypes $i $unknownType
        }
    }
    if {[llength $returnTypes]==1} {
        return [lindex $returnTypes 0]
    }
    # todo if xotcl types compute the most parent class or xotcl
    set isobject 1
    set oreturnTypes [list]
    foreach o $returnTypes {
        if {[lindex $o 0] ni {xotcl class tk} && [lindex $o 0] ne "void"} {
            set isobject 0
            break
        } elseif {[lindex $o 0] ne "void"} {
            lappend oreturnTypes $o
        }
    }
    if {$isobject} {
        set classes [$repository getFullHeritage [lindex $oreturnTypes 0 1]]
        foreach t [lrange $oreturnTypes 1 end] {
            set tclasses [$repository getFullHeritage [lindex $t 1]]
            set i 0
            foreach c $classes {
                if {$c in $tclasses} {
                    break
                }
                incr i
            }
            set classes [lrange $classes $i end]
            if {[llength $classes]==0} {
                return [lindex $oreturnTypes 0 0]
            }
        }
        return [list [lindex $oreturnTypes 0 0] [lindex $classes 0]]
    }

    set type [lindex $returnTypes 0]
    if {[lindex $type 0] eq "unknown"} {
        return $unknownType
    }
    foreach t [lrange $returnTypes 1 end] {
        set t0 [lindex $t 0]
        if {$t0 eq "unknown"} {
            return $unknownType
        }
        if {$t0 ne "void" && $type ne $t} {
            if {[$repository canAssignType $type $t]} {
                # nothing
            } elseif {[$repository canAssignType $t $type]} {
                set type $t
            } else {
                tlog::info "can not compute one return type $t $type -> is unknown"
                return $unknownType
            }
        }
    }
    return $type
}
