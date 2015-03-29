PrsArgumentMatcher instproc applyTypes {arguments types notifier descsAll} {
    my instvar context
    set realTypes [list]
    set allOk 1
    foreach elem $arguments typeIndex $types {
        lassign $typeIndex type index
        set type0 [lindex $type 0]
        if {$type0 ne "_"} {
            if {$type0 eq "new"} {
                if {[$elem hasclass PrsLiteral]} {
                    set name [$elem prsString]
                    [$context set repository] registerObject $name [lindex $type 2] {} {}
                } elseif {[$elem hasclass PrsVariable]} {
                    set type [lrange $type 1 end]
                    if {[$elem isArray]} {
                        set type [linsert $type 0 array]
                    }
                    $context checkVariableType [$elem getVariableName] $type 1
                }
            } else {
                if {[$elem checkAsType $type $context $notifier]} {
                    lappend realTypes [list [$context getTypeFromElem $elem] $index]
                } else {
                    if {$type0 ni {xotcl class tk}} {
                        set allOk 0
                    } else {
                        # force update for object types for merging type to supertype if possible
                        lappend realTypes [list [$context getTypeFromElem $elem] $index]
                    }
                }
            }
        } else {
            lappend realTypes [list unknown $index]
        }
    }
    if {$allOk && [llength $realTypes]>0} {
        [$context set repository] updateSignatureTypes $descsAll $realTypes
    }
}
