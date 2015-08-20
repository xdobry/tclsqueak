PrsNoSubst instproc checkAsType {rtype context notifier} {
    my instvar operation begin end
    set mtype [my getType]
    set rtype0 [lindex $rtype 0]
    set mtype0 [lindex $mtype 0]
    if {$mtype0 eq "unknown"} {
        my setType $rtype
        if {$rtype0 eq "body"} {
            if {![info exists operation] || $operation ne "eval"} {
                $context evalContents [self]
            }
        } elseif {$rtype0 eq "script"} {
            if {![info exists operation] || $operation ne "eval"} {
                $context subParseGlobal [self] $notifier {}
            }
        } elseif {$rtype0 eq "bindscript"} {
            if {[string index [my prsContentString] 0] eq "+"} {
                set subscript [PrsScript new -childof [self] -begin [expr {$begin+[my getContentOffset]+1}] -end [expr {$end-[my getContentOffset]}]]
                my addElem $subscript
                $subscript checkAsType script $context $notifier
                return 1
            }
            if {![info exists operation] || $operation ne "eval"} {
                $context subParseGlobal [self] $notifier {}
            }
        }
        return 1
    }
    if {[$context canAssignType $rtype $mtype]} {
         return 1
    }
    if {$rtype0 in {ref setref wref}} {
        return [my checkRefAsType $rtype $context $notifier]
    } else {
        if {$mtype0 eq "array"} {
            $notifier addError "can not use array as $rtype0" [self]
        } else {
            $notifier addError "possibly error expect as '[join $rtype]' but is '[join $mtype]'" [self]
        }
        return 0
    }
}
