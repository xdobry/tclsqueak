IDE::NListView instproc buttonDoublePush {} {
    my instvar notify doubleNotifyProc
    if {[info exists notify] && [info exists doubleNotifyProc]} {
        $notify $doubleNotifyProc [my selectedItemFirst]
    } else {
        next
    }
}
