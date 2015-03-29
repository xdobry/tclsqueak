IDE::ProcsGroup proc buildStuctFromArray arr_ref {
    upvar $arr_ref arr
    if {![array exists arr]} return
    for {set sid [array startsearch arr]} {[array anymore arr $sid]} {} {
        set key [array nextelement arr $sid]
        set w $arr($key)
        set component [lindex $w 0]
        set group [lindex $w 1]
        set cobj [IDE::Component getCompObjectForNameIfExist $component]
        if {$cobj eq ""} {
            puts stderr "No component $component by building tcl proc wrappers"
        }
        if {[namespace tail $key] ne $key} {
            set withNamespace 1
        } else {
            set withNamespace 0
        }
        set gobj [$cobj createTclProcsGroup $group $withNamespace]
        $gobj createProcForName $key
    }
    array donesearch arr $sid
}
