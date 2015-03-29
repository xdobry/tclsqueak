IDE::ObjectBrowser proc browseAllInstances {class {introProxy {}}} {
    if {$introProxy eq ""} {
        set introProxy [IDE::XOIntroProxy getIntroProxyForObject $class]
    }
    if {$introProxy eq ""} {
        return
    }
    if {![$introProxy isObjectClass $class]} {
        return
    }
    set objectList [lsort [$introProxy getInstancesForClass $class]]
    if {[llength $objectList]==0} {
        IDE::Dialog message "$class has no instances"
    } elseif {[llength $objectList]==1} {
        my newBrowser [lindex $objectList 0] $introProxy
    } else {
        my browseObjectsList $objectList $introProxy
    }
}
