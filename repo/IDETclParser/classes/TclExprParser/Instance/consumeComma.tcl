TclExprParser instproc consumeComma {} {
    my instvar valueStack opStack
    if {[llength $opStack]==0} {
        my addError "can not find function by comma"
    }
    while {[my getOpValue [lindex $opStack end]] ni {( ,}} {
        my consumeOp
        if {[llength $opStack]==0} {
            my addError "can not find function by comma"
        }
    }
}
