IDE::CBCodeController instproc addItemToHistory actItem {
    my instvar history historyIndex
    if {[lindex $history $historyIndex] ne $actItem} {
        # same logic as browser history
        if {[llength $history]==$historyIndex+1} {
            lappend history $actItem
        } else {
            set history [lreplace $history $historyIndex+1 end $actItem]
            my setButtonState nextButton 0
        }
        incr historyIndex
        if {$historyIndex>0} {
            my setButtonState prevButton 1
        }
    }
}
