IDE::ObjectDescription instproc getMethodDescriptions {} {
    set ret {}
    foreach obj [my info children] {
        if {[$obj istype IDE::ClassMethodDescription]} {
            lappend ret $obj
        }
    }
    foreach obj [my info children] {
        if {[$obj istype IDE::InstanceMethodDescription]} {
            lappend ret $obj
        }
    }
    return $ret
}
