IDE::ObjectDescription instproc setDefMethodsArray arr_ref {
    upvar $arr_ref arr
    foreach obj [my info children] {
        if {[$obj istype IDE::DefVersionDescription]} {
            set arr([$obj getName]) [$obj set methodid]
        }
    }
}
