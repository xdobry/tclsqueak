PrsContext instproc check_try {count command notifier} {
    my evalContents [$command getElem 1]
    set i 2
    while {$i<$count} {
        set elem [$command getElem $i]
        incr i
        if {[$elem hasclass PrsLiteral]} {
            set name [$elem prsString]
            switch $name {
                on {
                   incr i 2
                }
                trap {
                   incr i 2
                }
                finally {

                }
                default {
                    $notifier addError "expect finally keyword" $elem
                    return
                }
            }
            if {$i>$count} {
                $notifier addError "expect additional parameter as body" $elem
                return
            }
            my evalContents [$command getElem $i]
       }
    }
}
