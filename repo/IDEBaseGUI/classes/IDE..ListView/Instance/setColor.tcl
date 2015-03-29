IDE::ListView instproc setColor color {
    my instvar win
    if {![winfo exists $win.listbox]} return
    if {$color eq ""} {
        $win.listbox configure -background [list [$win.listbox configure -background] 3]
    } else {
        $win.listbox configure -background $color
    }
}
