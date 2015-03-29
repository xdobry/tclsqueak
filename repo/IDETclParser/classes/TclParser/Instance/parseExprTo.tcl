TclParser instproc parseExprTo {elem context notifier} {
    my instvar exprParser
    if {![info exists exprParser]} {
        set exprParser [TclExprParser new -childof [self] -parser [self]]
    }
    $exprParser parseExprTo $elem $context $notifier
    return $elem
}
