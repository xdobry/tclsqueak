IDE::System proc showBusyWhile script {
    update idletasks
    set win [focus]
    if {$win ne ""} {
        set win [winfo toplevel $win]
    }
    if {$win eq ""} { 
        set win .
    }
    set alt [$win cget -cursor]
    $win configure -cursor clock
    uplevel $script
    $win configure -cursor $alt
}
