IDE::MethodTracker proc unregisterObjectForTracking object {
    my instvar trackedArr
    catch {unset trackedArr($object)}
    IDE::TrackerBrowser removeFromTrackList $object
    set filter [$object info filter]
    if {"ideFilter" in $filter} {
         $object filter delete $filter
    }
}
