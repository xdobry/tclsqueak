IDEPreferences proc loadPreferences {} {
    my setDefaultPreferences
    set prefFileName [file join [my initAndgetPrepDirectory] [my prefFileName]]
    if {[file exists $prefFileName]} {
        my loadPreferencesFromFile $prefFileName
    }
}
