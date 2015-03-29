proc handleTabPress {object state} {
    # state shows the control buttons 0 mean only tab
    set state [expr {$state&5}]
    if {$state!=0} {
        if {$state==4} {
            $object tabShiftPress
            return -code break
        }
        return
    }
    if {[$object codeCompletion 1]} {
        return -code break
    }
}
