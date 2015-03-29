PrsOOTclContext instproc checkTclCommand {cmdName command notifier} {
    my instvar isTclGlobalScript repository name namespace defCommands
    if {!$isTclGlobalScript} {
        # we are in scope of method defintion (see method def_method for switch)
        set desc [$repository getMethodDescriptionForClasses [list $name] $cmdName $namespace]
        if {$desc eq ""} {
            # search for proc methods (class methods)
            set desc [$repository getMethodDescriptionForObject $name $cmdName $namespace]
        }
        if {$desc ne ""} {
            [$command getElem 0] set ref [list method [lindex $desc 0]]
            my checkParametersToDesc $command $notifier 1 $desc
        } else {
            next
        }
    } else {
        # we are in class global scope
        if {$cmdName ni $defCommands} {
            next
        } else {
            my checkTclCommandInner $command $notifier 0
        }
    }
}
