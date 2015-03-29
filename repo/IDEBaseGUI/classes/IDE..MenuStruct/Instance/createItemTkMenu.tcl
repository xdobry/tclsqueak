IDE::MenuStruct instproc createItemTkMenu {win {tl_win {}}} {
    if {![my exists enablementHandler] && [[my info parent] exists enablementHandler]} {
        my enablementHandler [[my info parent] enablementHandler]
    }
    if {[my enableList] eq ""} {
        my enableList [[my info parent] enableList]
    }
    $win add cascade -label [my set name] -menu [my createTkMenu $win.[Object autoname cmenu] $tl_win]
}
