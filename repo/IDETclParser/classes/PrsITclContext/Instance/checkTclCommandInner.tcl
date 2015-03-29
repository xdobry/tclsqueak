PrsITclContext instproc checkTclCommandInner {name command notifier startArg visibilty} {
    if {[$command argsCount]<$startArg} {
        $notifier addError "expect more parameters" [$command getElem 0]
        return
    }
    set cmdElem [$command getElem $startArg]
    set defCommands {inherit constructor destructor method proc variable common set array}
    if {![$cmdElem hasclass PrsLiteral]} {
        $notifier addError "expect itcl defintion one of ([join $defCommands ,])" $cmdElem
        return
    }
    set cmd [$cmdElem prsString]
    if {$cmd ni $defCommands} {
        $notifier addError "expect itcl defintion one of ([join $defCommands ,])" $cmdElem
        return
    }
    incr startArg
    my def_$cmd $command $startArg $notifier $visibilty

}
