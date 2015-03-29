PrsCommandSubst instproc checkAsType {rtype context notifier} {
    my instvar lastCommand
    if {[info exists lastCommand]} {
        return [$lastCommand checkAsType $rtype $context $notifier]
    }
    return 1
}
