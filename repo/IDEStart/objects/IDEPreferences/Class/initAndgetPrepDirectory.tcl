IDEPreferences proc initAndgetPrepDirectory {} {
    global xotclidedir
    set prepDirectory tclsqueak-prefs
    if {[info exists xotclidedir] && [file isdirectory [file join $xotclidedir $prepDirectory]]} {
        return [file join $xotclidedir $prepDirectory]
    }
    set prepDirectory [file join ~ .tclsqueak]
    if {![file isdirectory $prepDirectory]} {
        set oldPrepDirectory [file join ~ .xotclide]
        if {[file isfile $oldPrepDirectory]} {
            set tempFile [file join ~ .xotclide.tmp]
            file rename $prepDirectory $tempFile
            file mkdir $prepDirectory
            file rename $tempFile [file join $prepDirectory xotclide.prefs]
        } elseif {[file isdirectory $oldPrepDirectory]} {
            file rename $oldPrepDirectory $prepDirectory
        } else {
            file mkdir $prepDirectory
            my set firstStart 1
        }
    }
    return $prepDirectory
}
