PrsITclContext instproc checkTclCommand {cmdName command notifier} {
    my instvar isTclGlobalScript repository name namespace defaultVisibility
    if {!$isTclGlobalScript} {
        if {$cmdName eq "chain"} {
            # just do not check arguments
            return
        }
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
        set defCommands {inherit constructor destructor method proc variable common public protected private set}
        if {$cmdName ni $defCommands} {
            next
        } else {
            if {$cmdName in {public protected private}} {
                if {[$command argsCount]==1} {
                    set oldVis $defaultVisibility
                    set defaultVisibility $cmdName
                    set body [$command getElem 1]
                    $body evalContents
                    $body visit [self]
                    set defaultVisibility $oldVis
                } else {
                    my checkTclCommandInner $cmdName $command $notifier 1 $cmdName
                }
            } else {
                my checkTclCommandInner $cmdName $command $notifier 0 $defaultVisibility
            }
        }
    }
}
