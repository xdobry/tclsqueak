PrsExpr instproc getType {{suggestedType {}}} {
    my instvar exprTree
    if {[info exists exprTree]} {
        [lindex $exprTree 0] getType
    }
    next
}
