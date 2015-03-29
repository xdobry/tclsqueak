IDE::ObjectDescription instproc trackingOn {} {
    if {$::xotcl::version>=1.3} {
        [my getObject] mixin add [my getTrackingClass]
    } else {
        [my getObject] mixinappend [my getTrackingClass]
    }
}
