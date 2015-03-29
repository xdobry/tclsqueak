IDE::ProcsGroupPer instproc setInstanceMethodsArray arr_ref {
    upvar $arr_ref arr
    foreach obj [my info children] {
        if {[$obj istype IDE::TclProcsDescription]} {
            set arr([$obj getName]) [$obj set methodid]
        }
    }
}
