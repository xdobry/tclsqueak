IDE::ObjectDescription instproc isTrackingOn {} {
    [my getObject] ismixin [my getTrackingClass]
}
