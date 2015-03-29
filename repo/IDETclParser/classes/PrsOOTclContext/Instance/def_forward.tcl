PrsOOTclContext instproc def_forward {command startArg notifier} {
    my instvar repository name namespace object
    my checkArgCount $command $startArg $notifier 2 -1
    set methodNameElem [$command getElem $startArg]
    if {[$methodNameElem hasclass PrsLiteral]} {
        set methodName [$methodNameElem prsString]
        tlog::trace "registering forward object $name for method $methodName"
        $repository registerMethod $name [list unknown] $methodName {{* unknown}} $namespace
    }
}
