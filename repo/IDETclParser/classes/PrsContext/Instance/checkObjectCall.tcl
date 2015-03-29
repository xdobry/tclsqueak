PrsContext instproc checkObjectCall {command notifier} {
    set first [lindex [$command list] 0]
    set type [my getTypeFromElem $first]

    set btype [lindex $type 0]
    #puts "checking object call [$command prsString] =btype $btype"

    if {$btype in {xotcl tk class}} {
        set argsCount [$command argsCount]
        if {$argsCount>0} {
            set method [$command getElem 1]
            if {[$method hasclass PrsLiteral]} {
                set methodName [$method prsString]
                set classes [lrange $type 1 end]
                if {[llength $classes]==0 && $btype eq "xotcl"} {
                    set classes [list ::xotcl::Object]
                } elseif {[llength $classes]==0 && $btype eq "tk"} {
                    set classes [list ::widget]
                }
                [$command getElem 0] set ref [list object [lindex $classes 0]]
                my checkObjectClassCall $classes $command $notifier
            }
        }
    } elseif {$btype eq "obj"} {
        my checkDirectObjectCall [lindex $type 1] $command $notifier
    } elseif {$btype ni {unknown tk def}} {
        $notifier addError "expect object to call but is $btype" $first
        if {[$first hasclass PrsVariable] && ![$first isArray]} {
            my addVariable [$first getVariableName] $first $notifier [list class] [my getDefaultScope] 1
        }
    }
}
