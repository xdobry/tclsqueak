PrsExpr instproc hasErrors {} {
    my instvar perror
    expr {[info exists perror] && [llength $perror]>0}
}
