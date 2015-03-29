IDE::ObjectDescription instproc setInstanceMethodsArray arr_ref {
    upvar $arr_ref arr
    foreach obj [my info children] {
        if {[$obj istype IDE::InstanceMethodDescription]} {
            set arr([$obj getName]) [$obj set methodid]
        }
    }
}
