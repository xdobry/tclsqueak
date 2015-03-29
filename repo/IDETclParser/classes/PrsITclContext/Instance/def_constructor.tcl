PrsITclContext instproc def_constructor {command startArg notifier visibilty} {
    my instvar repository isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 2 3
    set isTclGlobalScript 0
    set isTclproc 1
    set isInstproc 1
    if {[$command argsCount]+$startArg-1==2} {
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
