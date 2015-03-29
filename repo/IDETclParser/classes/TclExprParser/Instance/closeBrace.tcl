TclExprParser instproc closeBrace {} {
    my instvar valueStack opStack
    if {[llength $opStack]==0} {
        my addError "unmatched braces"
        return
    }
    set commaCount 0
    # brace can be also part of function call so we need to skip ,
    while {[my getOpValue [lindex $opStack end]] ne "("} {
        if {[my getOpValue [lindex $opStack end]] eq ","} {
            incr commaCount
            set opStack [lrange $opStack 0 end-1]
        } else {
            my consumeOp
        }
        if {[llength $opStack]==0} {
            my addError "unmatched braces"
            return
        }
    }
    set openBrace [lindex $opStack end]
    set opStack [lrange $opStack 0 end-1]
    set retType numeric
    if {[llength $opStack]>0} {
        set top [lindex $opStack end]
        # check if the braces was part of function
        set functionName [my getOpValue $top]
        set functArgCount [my getFunctionArgCount $functionName]
        if {$functArgCount!=-2} {
            set functionTypes [my getFunctionTypes $functionName]
            if {$functArgCount!=-1 && $functArgCount!=$commaCount+1 && $functArgCount!=0 && $commaCount!=0} {
                my addError "funct $top expect $functArgCount arguments but was [expr {$commaCount+1}]"
                return
            }
            if {$functArgCount>0} {
                set values [lrange $valueStack end-$commaCount end]
                my applyTypes $top $values $functionTypes
                set braceToken [concat $top $values]
                set valueStack [lreplace $valueStack end-$commaCount end $braceToken]
            } else {
                $top set type [lindex $functionTypes 0]
                lappend valueStack [list $top]
            }
            set opStack [lrange $opStack 0 end-1]
            return
        }
    }
    if {$commaCount>0} {
        my addError "found comma wihout function"
        return
    }
    set braceValue [lindex $valueStack end]
    $openBrace set type [[lindex $braceValue 0] getType]
    set braceToken [list $openBrace $braceValue]
    lset valueStack end $braceToken
}
