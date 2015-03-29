IDE::MenuStruct instproc buildPopDownMenu {win twin} {
    if {![my exists menuItems]} return
    menu $win -tearoff 0
    foreach m [my set menuItems] {
        if {![my popdownMenu] && ![$m popdownMenu]} continue
        $m buildItemPopDownMenu $win $twin
    }
    return $win
}
