ReadStringStream instproc atEnd {} {
    my instvar pos lastpos
    expr {$pos>$lastpos}
}
