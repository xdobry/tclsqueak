IDE::DebuggerMethodEdit instproc evalSelectionAction {} {
    set sel [my getSelection]
    if {$sel ne ""} {
        [my info parent] evalAtLevel $sel
    }
}
