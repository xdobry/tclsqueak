PrsITclContext instproc def_destructor {command startArg notifier visibilty} {
    my instvar repository isTclGlobalScript object isTclproc
    my checkArgCount $command $startArg $notifier 1 1
    set isTclGlobalScript 0
    set isTclproc 1
    set bodyElem [$command getElem $startArg]
    my evalContents $bodyElem
    $command set def [list method [list $object instproc destructor]]
    my cleanupLocalVars
    set isTclGlobalScript 1
}
