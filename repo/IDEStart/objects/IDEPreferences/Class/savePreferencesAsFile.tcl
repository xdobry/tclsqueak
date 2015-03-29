IDEPreferences proc savePreferencesAsFile file {
    my instvar preferences
    set ret [catch {set preffile [open $file w]} openError]
    if {$ret != 0} {
        tk_messageBox -title Error -message "Can not open preference file $openError"  -icon error -type ok
        return
    }
    puts $preffile "# preferences for program XOTclIDE"
    set indicator [array startsearch preferences]
    while {[array anymore preferences $indicator]} {
        set elem [array nextelement preferences $indicator]
        puts $preffile "[list $elem] [list $preferences($elem)]"
    }
    array donesearch preferences $indicator
    foreach key [my info vars] {
        if {$key ni {preferences firstStart} && ![my array exists $key]} {
            puts $preffile "[list $key] [list [my set $key]]"
        }
    }
    close $preffile
}
