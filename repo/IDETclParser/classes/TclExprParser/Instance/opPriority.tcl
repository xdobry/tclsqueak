TclExprParser instproc opPriority op {
    my instvar operatorsArr
    lindex $operatorsArr([my getOpValue $op]) 0
}
