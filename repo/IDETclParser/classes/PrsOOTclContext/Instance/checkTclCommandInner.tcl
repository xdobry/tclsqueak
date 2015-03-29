PrsOOTclContext instproc checkTclCommandInner {command notifier startArg} {
    my instvar defCommands
    if {[$command argsCount]<$startArg} {
        $notifier addError "expect more parameters" [$command getElem 0]
        return
    }
    set cmdElem [$command getElem $startArg]
    if {![$cmdElem hasclass PrsLiteral]} {
        $notifier addError "expect ootcl defintion one of ([join $defCommands ,])" $cmdElem
        return
    }
    set cmd [$cmdElem prsString]
    if {$cmd ni $defCommands} {
        $notifier addError "expect ootcl defintion one of ([join $defCommands ,])" $cmdElem
        return
    }
    incr startArg
    my def_$cmd $command $startArg $notifier

}
