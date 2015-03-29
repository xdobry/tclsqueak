TclExprParser instproc emtyStacks {} {
    my instvar valueStack opStack isError
    while {[llength $opStack]>0 && !$isError} {
        my consumeOp
    }

}
