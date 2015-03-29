IDE::MethodTracker proc registerClassForTracking class {
    my instvar trackedArr
    if {[info exists trackedArr($class)]} return
    set trackedArr($class) _class
    IDE::TrackerBrowser addToTrackList $class
    $class instfilter add ideFilter
}
