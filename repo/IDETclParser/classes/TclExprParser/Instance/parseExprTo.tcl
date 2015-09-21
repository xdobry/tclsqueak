TclExprParser instproc parseExprTo {pelem tcontext tnotifier} {
    my instvar elem stream parser isError valueStack opStack context notifier
    #ttc vartype pelem xotcl ::PrsElementList
    set elem $pelem
    set context $tcontext
    set notifier $tnotifier
    set stream [$parser stream]
    set valueStack [list]
    set opStack [list]
    set isError 0
    set lastType op
    $elem class PrsExpr
    set count 0

    while {!$isError} {
        set token [my getNextToken]
        incr count
        if {$count>100} {
            error "end loop"
        }
        if {$isError} {
            return
        }
        if {[llength $token]==0} {
            my emtyStacks
            if {[llength $valueStack]!=1} {
                my addError "error in expression missing operator"
                return
            }
            $elem set exprTree [lindex $valueStack end]
            $elem set type [[lindex $valueStack end 0] getType]
            #puts [$elem getTreeAsString]
            return
        }
        lassign $token tokValue tokType
        if {($lastType eq $tokType && $tokType ni {( )}) || ($tokType eq "op" && $lastType eq "(")} {
            if {$tokType eq "op" && [my getOpValue $tokValue] in {+ - ! ~}} {
                if {[my getOpValue $tokValue] in {+ -}} {
                    $tokValue set op [$tokValue prsString]_
                }
                lappend opStack ${tokValue}
                continue
            }
            my addError "mismatch in expression same type $tokType" $tokValue
            return
        }
        switch -exact $tokType {
            op {
                my pushOp $tokValue
            }
            value {
                lappend valueStack $tokValue
            }
            ( {
                lappend opStack $tokValue
            }
            ) {
                if {$lastType eq "("} {
                    # this need to be function
                    set fargCount [my getFunctionArgCount [my getOpValue [lindex $opStack end-1]]]
                    if {$fargCount==-2} {
                        #my halt
                        my addError "empty braces without function" $tokValue
                        return
                    }
                }
                my closeBrace
            }
            , {
                my consumeComma
                lappend opStack $tokValue
            }
            funct {
                lappend opStack $tokValue
            }
            default {
                my addError "unknown token type $tokType" $tokValue
                return
            }
        }
        set lastType $tokType
    }
}
