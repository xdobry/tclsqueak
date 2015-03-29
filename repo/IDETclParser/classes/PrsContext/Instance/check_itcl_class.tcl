PrsContext instproc check_itcl_class {count command notifier} {
    my instvar repository namespace parser parseMode
    set context [PrsITclContext new -childof [self] -namespace $namespace -repository $repository -parser $parser]
    $context set parseMode $parseMode
    $context evalClassBody $command [self] $notifier
    my importErrors $context 0
    # [$command set begin]
    $context destroy
}
