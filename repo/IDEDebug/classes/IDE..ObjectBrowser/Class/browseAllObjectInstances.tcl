IDE::ObjectBrowser proc browseAllObjectInstances {} {
    set instances {}
    foreach instance [Object info instances] {
        if {[string first ::xotcl:: $instance]==0} {
            continue
        }
        if {![Object isobject [$instance info parent]] || [Object isclass [$instance info parent]]} {
            lappend instances $instance
        }
    }
    my browseObjectsList [lsort $instances]
}
