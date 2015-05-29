IDE::MenuStruct instproc createItemTkMenu {win {tl_win {}}} {
    if {[my enableList] eq ""} {
        my enableList [[my info parent] enableList]
    }
    $win add cascade -label [my set name] -menu [my createTkMenu $win.[Object autoname cmenu] $tl_win]
}
