IDE::MethodTracker proc registerObjectForTracking object {
    my instvar trackedArr
    if {[info exists trackedArr($object)]} return
    set trackedArr($object) _object
    IDE::TrackerBrowser addToTrackList $object
    $object filter add ideFilter
}
