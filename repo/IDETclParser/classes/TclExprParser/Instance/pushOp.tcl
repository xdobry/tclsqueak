TclExprParser instproc pushOp opValue {
    my instvar opStack isError
    set opPrority [my opPriority $opValue]
    set i 0
    while {[llength $opStack]!=0 && $opPrority>[my opPriority [lindex $opStack end]] && !$isError} {
        incr i
        my consumeOp
        if {$i>1000} {
            error "endless loop"
        }
    }
    lappend opStack $opValue
}
