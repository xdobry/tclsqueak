IDE::GlobalVarsView instproc addToReadTrace actual {
    if {[string range $actual 0 1] ne "::"} {
        set variable ::$actual
    } else {
        set variable $actual
    }
    IDE::VarsTracker addTrace $variable read
}
