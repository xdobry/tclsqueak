IDEPreferences proc initAndgetPrepDirectory {} {
    set prepDirectory xotclide-prefs
    if {[file isdirectory $prepDirectory]} {
        return $prepDirectory
    }
    set prepDirectory [file join ~ .xotclide]
    if {[file isfile $prepDirectory]} {
        set tempFile [file join ~ .xotclide.tmp]
        file rename $prepDirectory $tempFile
        file mkdir $prepDirectory
        file rename $tempFile [file join $prepDirectory xotclide.prefs]
    } elseif {![file isdirectory $prepDirectory]} {
        file mkdir $prepDirectory
        my set firstStart 1
    }
    return $prepDirectory
}
