PrsITclContext instproc def_set {command startArg notifier visibilty} {
    my instvar repository name namespace
    my checkArgCount $command $startArg $notifier 1 2
    set varName [$command getElem $startArg]
    incr startArg
    set valueElem [$command getElem $startArg]
    my addVariableFrom $varName $notifier [my getTypeFromElem $valueElem] [list instproc $name]
}
