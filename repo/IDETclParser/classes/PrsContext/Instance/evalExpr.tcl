PrsContext instproc evalExpr {elem notifier} {
    #ttc vartype elem xotcl ::PrsElement
    #ttc vartype notifier xotcl ::PrsContext
    $elem evalExpr [self] $notifier
    $elem visit [self]
}
