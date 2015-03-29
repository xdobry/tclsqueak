PrsContext instproc checkCommand {command notifier} {
    my instvar localprocsArr isTclproc repository namespace localObject

    set first [lindex [$command list] 0]

    if {[$first hasclass PrsLiteral]} {
        set name [$first prsString]
        if {$name eq ""} {
            # this can happen if empty ; are used
            return 1
        }

        if {$name eq "my"} {
            my checkObjectSelfCall $command $notifier
            # xotcl defines package as object but it has not all object interface and makes problems
        } elseif {[$repository isXotclObject $name $namespace] && $name ne "package"} {
            #puts "checking $name"
            set obj [$repository getFullObjectName $name $namespace]
            my checkDirectObjectCall $obj $command $notifier
        } elseif {![catch {set localObject($name)} type]} {
            my checkObjectClassCall [list $type] $command $notifier
        } else {
            my checkTclCommand $name $command $notifier
        }
    } elseif {[$first hasclass PrsCommandSubst] && [$first prsString] eq {[self]}} {
        my checkObjectSelfCall $command $notifier
    } elseif {[$first hasclass PrsVariable] || [$first hasclass PrsCommandSubst]} {
        my checkObjectCall $command $notifier
    }

    return 1
}
