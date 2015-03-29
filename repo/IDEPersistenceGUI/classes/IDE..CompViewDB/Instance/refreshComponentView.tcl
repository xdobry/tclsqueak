IDE::CompViewDB instproc refreshComponentView component {
    set cobj [IDE::Component getCompObjectForNameIfExist $component]
    set index [lsearch -exact [my getList] $component]
    if {$cobj ne "" && $index!=-1} {
        if {[$cobj isPersistent]} {
            if {![$cobj isclosed]} {
                set color blue
            } else {
                set color default
            }
        } else {
            set color darkgreen
        }
        my markItemIndexForeGround $index $color
    }
}
