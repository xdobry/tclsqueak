IDEStarter proc loadPreferences {} {
    if {![my set ignoreprefs]} {
        IDEPreferences loadPreferences
    }
    if {[my exists preferences]} {
        foreach {key value} [my set preferences] {
            IDEPreferences setParameter $key $value
        }
    }
}
