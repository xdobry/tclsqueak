IDEPreferences proc loadPreferencesFromFile file {
    my instvar preferences
    set preffile [open $file r]
    while {[gets $preffile line] >= 0} {
        if {[string index [string trim $line] 0] eq "#"} continue
        lassign $line key value
        if {$key ni {preferences firstStart}} {
            set preferences($key) $value
        } else {
            my set $key $value
        }
    }
    close $preffile
}
