IDE::MethodTracker proc getTrackingList {} {
    my instvar trackedArr
    if {![array exists trackedArr]} return
    set ret {}
    foreach k [array names trackedArr] {
        set mlist $trackedArr($k)
        if {$mlist eq "_class"} {
            lappend ret $k
            continue
        }
        if {$mlist eq "_object"} {
            lappend ret "$k of [$k info class]"
            continue
        }
        foreach m $mlist {
            lappend ret $k>$m
        }
    }
    return $ret
}
