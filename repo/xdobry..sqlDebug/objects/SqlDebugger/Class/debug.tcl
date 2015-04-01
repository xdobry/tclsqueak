SqlDebugger proc debug {} {
    if {![winfo exist .sqlmonitor]} {
        my buildWindow
        my activate
    }
}
