PrsOOTclContext instproc def_destructor {command startArg notifier} {
    my instvar repository isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 1 1
    set isTclGlobalScript 0
    set isTclproc 0
    set isInstproc 1
    if {[$command argsCount]-$startArg+1==1} {
        set bodyElem [$command getElem $startArg]
        my evalContents $bodyElem
        $command set def [list method [list $object instproc destructor]]
        my cleanupLocalVars
    }
    set isTclGlobalScript 1
}
