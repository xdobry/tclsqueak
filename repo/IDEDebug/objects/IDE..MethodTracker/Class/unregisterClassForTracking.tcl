IDE::MethodTracker proc unregisterClassForTracking class {
    my instvar trackedArr
    catch {unset trackedArr($class)}
    IDE::TrackerBrowser removeFromTrackList $class
    set filter [$class info instfilter]
    if {"ideFilter" in $filter} {
         $class instfilter delete $filter
    }
}
