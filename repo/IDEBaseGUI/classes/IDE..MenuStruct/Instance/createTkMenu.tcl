IDE::MenuStruct instproc createTkMenu {twin {tl_win {}}} {
    my instvar win
    set win $twin
    if {![my exists menuItems]} return
    if {[my exists popdownMenuOnly] && [my popdownMenuOnly]} return
    menu $win -tearoff 0 -postcommand [list [self] menuIsMapped $win]
    foreach m [my set menuItems] {
        $m createItemTkMenu $win $tl_win
    }
    return $win
}
