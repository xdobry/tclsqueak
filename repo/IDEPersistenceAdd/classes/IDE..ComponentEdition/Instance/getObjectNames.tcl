IDE::ComponentEdition instproc getObjectNames {} {
    set ret [list]
    foreach obj [my info children] {
        if {[$obj istype IDE::ObjectEdition]} {
            lappend ret [$obj getName]
        }
    }
    return $ret
}
