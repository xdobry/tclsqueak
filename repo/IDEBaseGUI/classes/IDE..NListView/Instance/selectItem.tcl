IDE::NListView instproc selectItem item {
    # !! I am not very happy about this
    # this should be changed in the future than
    # an application modell is available
    my instvar notify notifyProc
    if {[info exists notify]} {
        if {[info exists notifyProc]} {
            $notify $notifyProc $item
        } else {
            $notify selectItem $item
        }
    }
}
