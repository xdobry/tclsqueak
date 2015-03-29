PrsContext instproc checkObjectClassCall {classList command notifier} {
    my instvar repository

    set argsCount [$command argsCount]
    if {$argsCount==0} {
        $command setType [concat xotcl $classList]
        return
    }
    set method [$command getElem 1]
    if {![$method hasclass ::PrsLiteral]} return
    set mname [$method prsString]

    set desc [$repository getMethodDescriptionForClasses $classList $mname]

    # search for subobject (my @subobject method par1 par2 ...)
    if {$desc eq ""} {
        set desc [$repository getVariableType [lindex $classList 0] subobject $mname]
        if {$desc ne ""} {
            if {$argsCount>=2} {
                set method [$command getElem 2]
                if {![$method hasclass ::PrsLiteral]} return
                set mname [$method prsString]
                set desc [$repository getMethodDescriptionForClasses [list $desc] $mname]
                if {$desc eq ""} {
                    if {[lindex $classList 0] ni {::xotcl::Object ::widget}} {
                        $notifier addError "method '$mname' unknown for types: $desc" $method
                    }
                } else {
                    my checkParametersToDesc $command $notifier 3 $desc
                    # TODO flexilbe parameter start
                    #if {[my info methods xocheck_$mname] ne ""} {
                    #    my xocheck_$mname [$command argsCount] instproc [list $desc] $command $notifier
                    #}
                    return
                }
            } else {
                $command setType [concat xotcl $desc]
                # call object method this return the object
                return
            }
        }
    }

    if {$desc eq ""} {
        if {[lindex $classList 0] ni {::xotcl::Object ::widget} && [llength $classList]>0} {
            $notifier addError "method '$mname' unknown for types: [join $classList {, }]" $method
        }
    } else {
        $method set ref [list method [lindex $desc 0]]
        my checkParametersToDesc $command $notifier 2 $desc
        #puts "check class call $mname"
        if {[my info methods xocheck_$mname] ne ""} {
            if {$mname in {create new}} {
                if {"::xotcl::Object" ne [$repository getFullHeritage [lindex $classList 0]]} {
                   return
                }
            }
            my xocheck_$mname [$command argsCount] instproc [lindex $classList 0] $command $notifier
        }
    }
}
