IDE::MenuStruct instproc buildItemPopDownMenu {win {tl_win {}}} {
    $win add cascade -label [my set name] -menu [my buildPopDownMenu $win.[Object autoname cmenu] $tl_win]
}
