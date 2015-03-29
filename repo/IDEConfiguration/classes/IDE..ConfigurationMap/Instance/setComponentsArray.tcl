IDE::ConfigurationMap instproc setComponentsArray arr_ref {
    upvar $arr_ref arr
    foreach obj [my getComponents] {
        set arr([$obj getName]) [$obj set componentid]
    }
}
