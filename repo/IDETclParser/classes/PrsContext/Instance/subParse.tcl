PrsContext instproc subParse {command notifier {namespace {}}} {
    my instvar parser errors
    set subcontext [my createSubcontext $notifier $command]
    $subcontext set namespace $namespace
    $subcontext parseAndCheckCommand $command
    my importErrors $subcontext 0
    my cleanupSubcontext $subcontext
}
