PrsOOTclContext instproc def_export {command startArg notifier} {
    my instvar repository name namespace isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 1 -1
}
