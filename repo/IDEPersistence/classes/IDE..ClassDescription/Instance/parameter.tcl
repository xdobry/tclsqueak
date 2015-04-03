IDE::ClassDescription instproc parameter args {
    next
    if {[llength $args]>0  && [[my getDescription] isTrackBodyChanges]} {
        [my getDescription] updateDefbody 0
    }
}
