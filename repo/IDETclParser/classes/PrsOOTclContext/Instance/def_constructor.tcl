PrsOOTclContext instproc def_constructor {command startArg notifier} {
    my instvar repository isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 2 2
    set isTclGlobalScript 0
    set isTclproc 0
    set isInstproc 1
    if {[$command argsCount]-$startArg+1==2} {
        set argumentElem [$command getElem $startArg]
        incr startArg
        set bodyElem [$command getElem $startArg]
        my parseArguments $argumentElem constructor
        my evalContents $bodyElem
        my registerMethod init $bodyElem
        $command set def [list method [list $object instproc constructor]]
        my cleanupLocalVars
    }
    set isTclGlobalScript 1
}
