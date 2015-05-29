IDE::CBCodeController instproc backNavigation {} {
    my instvar history historyIndex
    while {$historyIndex>=1} {
        incr historyIndex -1
        set hitem [lindex $history $historyIndex]
        if {[my checkItem $hitem]} {
            my selectHItemRefresh $hitem
            break
        }
        set history [lreplace $history $historyIndex $historyIndex]
    }
    if {$historyIndex==0} {
        my setButtonState prevButton 0
    }
    my setButtonState nextButton 1
}
