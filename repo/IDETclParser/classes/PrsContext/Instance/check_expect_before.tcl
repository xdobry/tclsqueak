PrsContext instproc check_expect_before {count command notifier} {
    # it is expect from expect tcl based application
    set options {-info}
    set aoptions {-i}
    set hasinfo 0
    set start 0
    while {$count>$start} {
        set elem [$command getElem $start]
        if {[$elem hasclass PrsLiteral]} {
            set content [$elem prsString]
            if {$content in $options} {
                set hasinfo 1
                incr count
            } elseif {$content in $aoptions} {
                incr count
                if {$count>$start} {
                    incr count
                } else {
                    my addError "option $content requires argument" $elem
                    return
                }
            } else {
                break
            }
        } else {
            break
        }
    }
    if {$hasinfo} {
        if {$count>$start} {
            my addError "unexpected parameters after -info" [$command getElem $start]
        }
        return
    } else {
        my check_expect $count $command $notifier
    }
}
