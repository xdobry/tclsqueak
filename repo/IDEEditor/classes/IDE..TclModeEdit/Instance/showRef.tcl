IDE::TclModeEdit instproc showRef tag {
    my instvar refArr
    set twin [my getTextWindow]
    set ctag ""
    foreach t [$twin tag names insert] {
        if {[string index $t 0] eq "d"} {
            my showRefTag $t
            return
        }
    }
}
