IDE::Text instproc setColor color {
    set win [my getTextWindow]
    if {![winfo exists $win]} return
    if {$color eq ""} {
        $win configure -background [list [$win.listbox configure -background] 3]
    } else {
        $win configure -background $color
    }
}
