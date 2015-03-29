IDE::VarsView instproc inspectAsObjectsList actual {
    my instvar vobject vtype
    if {$vtype eq "array"} {
        set value {}
        for {set sid [my varAction array startsearch $actual]} {[my varAction array anymore $actual $sid]} {} {lappend value [my varAction set ${actual}([my varAction array nextelement $actual $sid])]}
        my varAction array donesearch $actual $sid
    } else {
        set value [my varAction set $actual]
    }
    set objects {}
    foreach obj $value {
        if {[IDE::XOIntroProxy getIntroProxyForObject $obj] ne ""} {
            lappend objects $obj
        }
    }
    if {[llength $objects]>0} {
        IDE::ObjectBrowser browseObjectsList $objects
    } else {
        IDE::Dialog message "There are no objects in the list"
    }
}
