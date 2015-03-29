PrsContext instproc oocheck_create {count type object command notifier} {
    my instvar repository namespace parser parseMode
    set context [PrsOOTclContext new -childof [self] -namespace $namespace -repository $repository -parser $parser]
    $context set parseMode $parseMode
    $context evalClassBody $command [self] $notifier
    my importErrors $context 0
    # [$command set begin]
    $context destroy
}
