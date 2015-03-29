IDE::TrackedMethodList instproc removeTrackItem actual {
    my removeItem $actual
    set vclass [lindex $actual 0]
    if {[Object isclass $vclass]} {
       IDE::MethodTracker unregisterClassForTracking $vclass
    } else {
       IDE::MethodTracker unregisterObjectForTracking $vclass
    }
}
