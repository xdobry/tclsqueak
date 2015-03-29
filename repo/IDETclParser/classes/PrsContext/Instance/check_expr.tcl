PrsContext instproc check_expr {count command notifier} {
    set expr [$command getElem 1]
    if {[$expr hasclass PrsQuoted]} {
        $notifier addError "possible unintended double substitution for expr use {}" $expr
    }
    my evalExpr $expr $notifier
    $command set type [my getTypeFromElem $expr]
}
