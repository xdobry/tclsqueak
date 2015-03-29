PrsITclContext instproc def_method {command startArg notifier visibilty} {
    my instvar repository name namespace isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 1 3
    set isTclGlobalScript 0
    set isTclproc 1
    set isInstproc 1
    if {[$command argsCount]-$startArg+1==3} {
        set nameElem [$command getElem $startArg]
        tlog::info "parse itcl method definition [$nameElem prsString]"
        incr startArg
        set argumentElem [$command getElem $startArg]
        incr startArg
        set bodyElem [$command getElem $startArg]
        my parseArguments $argumentElem [$nameElem prsString]
        my evalContents $bodyElem
        if {[$nameElem hasclass PrsLiteral]} {
            set methodName [$nameElem prsString]
            my registerMethod $methodName $bodyElem
            $command set def [list method [list $object instproc $methodName]]
        }
        my cleanupLocalVars
    }
    set isTclGlobalScript 1
}
