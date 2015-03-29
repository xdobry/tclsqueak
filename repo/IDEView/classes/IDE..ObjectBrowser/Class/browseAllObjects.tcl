IDE::ObjectBrowser proc browseAllObjects {} {
    set instances {}
    set ignoreClasses(::Class) 1
    set ignoreClasses(::Object) 1
    foreach class [lsort [::Class info instances]] {
        if {[info exists ignoreClasses($class)]} continue
        foreach instance [$class info instances] {
            if {![Object isobject [$instance info parent]] || [Object isclass [$instance info parent]]} {
                lappend instances $instance
            }
        }
    }
    my browseObjectsList [lsort $instances]
}
