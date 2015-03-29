PrsITclContext instproc def_common {command startArg notifier visibilty} {
    my instvar repository name namespace
    my checkArgCount $command $startArg $notifier 1 2
    set argsCount [expr {[$command argsCount]-$startArg+1}]
    if {$argsCount>=2} {
        set type [my getTypeFromElem [$command getElem $startArg]]
    } else {
        set type [list def]
    }
    my addVariableFrom [$command getElem $startArg] $notifier $type [list proc $name]
}
