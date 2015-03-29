PrsContext instproc subParseGlobal {elem notifier {namespace {}}} {
    my instvar parser errors
    set subcontext [my createSubcontext $notifier $elem]
    $subcontext set namespace $namespace
    $subcontext parseGlobalCommand $elem
    my importErrors $subcontext 0
    my cleanupSubcontext $subcontext
}
