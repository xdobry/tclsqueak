PrsOOTclContext instproc def_method {command startArg notifier} {
    my instvar repository name namespace isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 3 3
    set isTclGlobalScript 0
    set isTclproc 0
    if {[$command argsCount]-$startArg+1==3} {
        set nameElem [$command getElem $startArg]
        tlog::info "parse ootcl method definition [$nameElem prsString]"
        incr startArg
        set argumentElem [$command getElem $startArg]
        incr startArg
        set bodyElem [$command getElem $startArg]
        my parseArguments $argumentElem [$nameElem prsString]
        my evalContents $bodyElem
        if {[$nameElem hasclass PrsLiteral]} {
            set methodName [$nameElem prsString]
            set proctype instproc
            if {!$isInstproc} {
                set proctype proc
            }
            my registerMethod $methodName $bodyElem $proctype
            $command set def [list method [list $object $proctype $methodName]]
        }
        my cleanupLocalVars
    }
    set isTclGlobalScript 1
}
