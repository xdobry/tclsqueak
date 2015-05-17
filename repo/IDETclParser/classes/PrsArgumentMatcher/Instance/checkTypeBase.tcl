PrsArgumentMatcher instproc checkTypeBase {elem typeIndex} {
    my instvar context fullName subcommands
    lassign $typeIndex type index
    set type0 [lindex $type 0]
    if {$type0 in {unknown def}} {
        return [list $typeIndex]
    }
    if {[llength $type]>1} {
        set otype $type0
        if {$otype eq "const"} {
            if {[$elem isLiteral [lindex $type 1]] || [my isUniqueSubcommand [$elem prsString] [lindex $type 1]]} {
                return _
            } else {
                my parseError $elem "unmatched const '[$elem prsString]' expect one of [join $subcommands ,]: $fullName"
            }
        } elseif {$otype eq "enum"} {
            if {[$elem hasclass PrsLiteral]} {
                if {[$elem prsString] in [lrange $type 1 end]} {
                    return _
                } else {
                    my parseError $elem "unmatched enums: [join [lrange $type 1 end] ,]: $fullName"
                }
            }
        } elseif {$otype in {wref setref ref gref setgref}} {
            # not real checking because. It will be done first by PrsElement->checkAsType
            if {[$elem hasclass PrsLiteral] || [$elem hasclass PrsQuoted]} {
                return [list $typeIndex]
            }
        } elseif {$otype in {xotcl class tk}} {
            # TODO elem type should be at list object type
            return [list $typeIndex]
        }
    }
    if {$type0 in {wref setref ref gref setgref}} {
        # not real checking because. It will be done first by PrsElement->checkAsType
        #my halt
        if {[$elem hasclass PrsLiteral] || [$elem hasclass PrsQuoted] || [$elem hasclass PrsVariableRef]} {
            return [list $typeIndex]
        }
        # TODO
        # set [getvarName] a
        return [list $typeIndex]
    }
    if {[$elem canAssignType $context $type]} {
         return [list $typeIndex]
    }
    if {$type eq "setref"} {
        #my halt
    }

    my parseError $elem "unmatched type '$type': $fullName"
}
