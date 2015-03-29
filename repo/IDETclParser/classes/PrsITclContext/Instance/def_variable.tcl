PrsITclContext instproc def_variable {command startArg notifier visibility} {
    my instvar repository name namespace parameters
    my checkArgCount $command $startArg $notifier 1 3
    set argsCount [expr {[$command argsCount]-$startArg+1}]
    if {$argsCount>=2} {
        set type [my getTypeFromElem [$command getElem $startArg]]
    } else {
        set type [list def]
    }
    # TODO config body
    set varNameElem [$command getElem $startArg]
    my addVariableFrom $varNameElem $notifier $type [list instproc $name]
    if {$visibility eq "public" && [$varNameElem hasclass PrsVariableRef]} {
        lappend parameters [$varNameElem getVariableName]
    }
}
