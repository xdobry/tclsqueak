TclExprParser instproc getOpTypes op {
    my instvar operatorsArr
    lindex $operatorsArr([my getOpValue $op]) 2
}
