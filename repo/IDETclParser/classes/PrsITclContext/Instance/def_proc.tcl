PrsITclContext instproc def_proc {command startArg notifier visibilty} {
    my instvar repository name namespace isTclGlobalScript object isTclproc isInstproc
    my checkArgCount $command $startArg $notifier 1 3
    set isTclGlobalScript 0
    set isTclproc 1
    set isInstproc 0
    if {[$command argsCount]-$startArg+1==3} {
        set nameElem [$command getElem $startArg]
        incr startArg
        set argumentElem [$command getElem $startArg]
        incr startArg
        set bodyElem [$command getElem $startArg]
        my parseArguments $argumentElem [$nameElem prsString]
        my evalContents $bodyElem
        if {[$nameElem hasclass PrsLiteral]} {
            set desc [my registerMethod [$nameElem prsString] $bodyElem proc]
            $command set def [list method [list $object proc [$nameElem prsString]]]
            if {$visibilty in {public default}} {
                $repository registerProc [$nameElem prsString] $desc [my joinNamespace $name]
            }
        }
        my cleanupLocalVars
    } elseif {[$command argsCount]-$startArg+1==2} {
        # if only definition register here because itcl::body does not know if it is method or proc
        set nameElem [$command getElem $startArg]
        incr startArg
        set argumentElem [$command getElem $startArg]
        my parseArguments $argumentElem [$nameElem prsString]
        if {[$nameElem hasclass PrsLiteral]} {
            my registerMethod [$nameElem prsString] "" proc
        }
        my cleanupLocalVars
    }
    set isTclGlobalScript 1
}
