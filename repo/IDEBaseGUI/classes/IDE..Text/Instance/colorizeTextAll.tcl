IDE::Text instproc colorizeTextAll text {
    set index 1.0
    while 1 {
        set index [my colorizeText $text $index]
        if {$index eq ""} break
    }
}
