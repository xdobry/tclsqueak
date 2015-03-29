IDE::VarsTracker proc newBrowser {} {
    if {![Object isobject ide_vars_tracker]} {
        my create ide_vars_tracker .varstracker
    }
}
