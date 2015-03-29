IDE::DebuggerMethodEdit instproc evalSubstituteSelection {} {
    my set action substitute
    set sel [my getSelection]
    if {$sel ne ""} {
        [my info parent] substituteAtLevel $sel
    }
}
