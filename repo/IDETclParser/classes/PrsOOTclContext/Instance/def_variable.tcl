PrsOOTclContext instproc def_variable {command startArg notifier} {
    my instvar repository name namespace parameters object
    my checkArgCount $command $startArg $notifier 1 -1
    set argsCount [$command argsCount]
    set varNames [list]
    for {set x $startArg} {$x<=$argsCount} {incr x} {
        set varNameElem [$command getElem $x]
        if {$x==$startArg && [$varNameElem prsString] in {-append -clear -set}} {
            continue
        }
        my addVariableFrom $varNameElem $notifier [list unknown] [list instproc $object]
        if {[$varNameElem hasclass PrsVariableRef]} {
            lappend varNames [$varNameElem prsString]
        }
    }
    set dparameters [$repository getClassParameters $name $namespace]
    # warning the variable definition can be in def context or seperate
    foreach p $varNames {
        if {$p ni $dparameters} {
            lappend dparameters $p
        }
        if {$p ni $parameters} {
            lappend parameters $p
        }
    }
    $repository updateClassParameters $name $dparameters $namespace
}
