Tcl2HTML instproc handleGlobalComment comment {
    next
    my instvar parseMode htmlOut
    if {$parseMode eq "report"} {
        if {[string trim $comment] ne ""} {
            $htmlOut putsNonewline {<span class='comment'>}
            $htmlOut putsNonewlineMasked $comment
            $htmlOut putsNonewline {</span>}
        } else {
            $htmlOut putsNonewlineMasked $comment
        }
    }
}
