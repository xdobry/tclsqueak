IDEPreferences proc savePreferences {} {
    my savePreferencesAsFile [file join [my initAndgetPrepDirectory] [my prefFileName]]
}
