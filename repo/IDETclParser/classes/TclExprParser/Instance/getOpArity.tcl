TclExprParser instproc getOpArity op {
    my instvar operatorsArr
    lindex $operatorsArr([my getOpValue $op]) 1
}
