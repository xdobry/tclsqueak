IDE::ClassDescription instproc superclass args {
    next
    if {[llength $args]>0} {
        [my getDescription] updateDefbody
    }
}
