IDE::ComponentEdition instproc setObjectsArray arr_ref {
    upvar $arr_ref arr
    foreach obj [my info children] {
        if {[$obj istype IDE::ObjectEdition]} {
            set arr([$obj getName]) [$obj set objectid]
        }
    }
}
