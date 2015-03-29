IDE::ObjectDescription instproc trackingOff {} {
    set obj [my getObject]
    set tclass [my getTrackingClass]
    if {[$obj ismixin $tclass]} {
        $obj mixin delete $tclass
    }
}
