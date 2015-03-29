TclExprParser instproc consumeOp {} {
    my instvar valueStack opStack
    set op [lindex $opStack end]
    set opValue [my getOpValue $op]
    if {$opValue eq ""} {
        return
    }
    if {$opValue eq "("} {
        my addError "unmatched braces" $op
        return
    }
    if {$opValue eq "?"} {
        my addError "? operator without :" $op
        return
    }
    set arity [my getOpArity $op]
    set opStack [lrange $opStack 0 end-1]
    if {$opValue eq ":"} {
        if {[llength $opStack]==0 || [my getOpValue [lindex $opStack end]] ne "?"} {
            my addError ": operator without leading ?"
            return
        }
        set opStack [lrange $opStack 0 end-1]
    }
    set endShif $arity
    incr endShif -1
    if {[llength $valueStack]<$arity} {
        my addError "expression error not enough values for [my getOpValue $op]"
        return
    }
    set values [lrange $valueStack end-$endShif end]
    set valueStack [lrange $valueStack 0 end-$arity]
    my applyTypes $op $values [my getOpTypes $op]
    lappend valueStack [concat $op $values]

}
