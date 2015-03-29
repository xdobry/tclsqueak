IDE::ObjectDescription instproc setClassMethodsArray arr_ref {
    upvar $arr_ref arr
    foreach obj [my info children] {
        if {[$obj istype IDE::ClassMethodDescription]} {
            set arr([$obj getName]) [$obj set methodid]
        }
    }
}
