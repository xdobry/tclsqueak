TclExprParser instproc applyTypes {opElem values types} {
    my instvar context notifier
    set opValue [my getOpValue $opElem]
    set ok 1
    set realTypes [list]
    set hasEqEmpty 0
    if {$opValue in {eq ne}} {
        foreach v $values {
            if {[llength $v]>1} {
                continue
            }
            set v0 [lindex $v 0]
            if {([$v0 hasclass PrsQuoted] || [$v0 hasclass PrsNoSubst]) && [$v0 prsContentString] eq ""} {
                set hasEqEmpty 1
                break
            }
        }
        if {$hasEqEmpty} {
            $opElem set type boolean
            return
        }
    }
    foreach v $values t [lrange $types 1 end] {
        if {$t ne "" && [llength $v]>0} {
            set v0 [lindex $v 0]
            #puts "apply type $t to [$v0 prsString] [$v0 info class]"
            if {[$v0 checkAsType $t $context $notifier]} {
                lappend realTypes [$context getTypeFromElem $v0]
                #puts "real type [$context getTypeFromElem $v0]"
            } else {
                #puts "type not ok req $t"
                set ok 0
            }
        }
    }
    set retType [lindex $types 0]
    if {$ok} {
        if {$retType eq "%n"} {
            set tretType int
            #puts "checking op $opValue $realTypes"
            foreach r $realTypes {
                if {$r eq "numeric"} {
                    set tretType numeric
                } elseif {$r eq "double" && $tretType ne "numeric"} {
                    set tretType double
                } elseif {$r in {unknown def}} {
                    set tretType numeric
                }
            }
            set retType $tretType
        } elseif {$retType eq "?"} {
            set retType [lindex $realTypes 1]
        }
    }
    if {$retType eq "%n"} {
        set retType numeric
    }
    $opElem set type $retType
}
