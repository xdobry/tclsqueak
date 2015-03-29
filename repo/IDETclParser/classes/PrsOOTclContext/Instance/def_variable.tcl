PrsOOTclContext instproc def_variable {command startArg notifier} {
    my instvar repository name namespace parameters
    my checkArgCount $command $startArg $notifier 1 3
    set argsCount [expr {[$command argsCount]-$startArg+1}]
    for {set x $startArg} {$x<=$argsCount} {incr x} {
        set varNameElem [$command getElem $startArg]
        if {$x==$startArg && [$varNameElem prsString] in {-append -clear -set}} {
            continue
        }
        my addVariableFrom $varNameElem $notifier [list unknown] [list instproc $name]
    }
}
