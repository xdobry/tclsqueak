PrsOOTclContext instproc def_self {command startArg notifier} {
    my instvar repository name namespace isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 1 -1
    set isInstproc 0
    set argsCount [expr {[$command argsCount]-$startArg+1}]
    if {$argsCount==1} {
        set body [$command getElem $startArg]
        $body evalContents
        $body visit [self]
    } else {
        my checkTclCommandInner $command $notifier $startArg
    }
    set isInstproc 1
}
