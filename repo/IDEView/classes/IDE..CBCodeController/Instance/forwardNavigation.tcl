IDE::CBCodeController instproc forwardNavigation {} {
    my instvar history historyIndex
    while {$historyIndex<[expr {[llength $history]-1}]} {
        incr historyIndex 1
        set hitem [lindex $history $historyIndex]
        if {[my checkItem $hitem]} {
            my selectHItemRefresh $hitem
            break
        }
        set history [lreplace $history $historyIndex $historyIndex]
    }
    if {$historyIndex==[llength $history]-1} {
        my setButtonState nextButton 0
    }
    my setButtonState prevButton 1
}
