IDE::TclScripEditor instproc runScript {} {
    set script [my getText]
    if {[my checkScript $script]} {
        IDE::System evalString $script
    }
}
