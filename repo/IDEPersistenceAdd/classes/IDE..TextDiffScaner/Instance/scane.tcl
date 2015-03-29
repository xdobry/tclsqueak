IDE::TextDiffScaner instproc scane {} {
    my instvar currDiff equalIndex diffAtStart diffAtEnd
    my initLength
    # the ideas of this algorithmus is to find equal areas
    # it is not the best one . see gnu diff algorithmus for very good one
    set start [list 0 0]
    set currDiff 0
    set end [list 0 0]
    set equalIndex {}
    set pos $start
    set diffAtStart 0
    set diffAtEnd 1
    while {$end ne "" && $pos ne ""} {
        set end [my endOfEqual $pos]
        if {$end ne ""} {
            if {$end!=[list 0 0]} {
                lappend equalIndex [list $pos $end]
            }
            set pos [my beginOfEqual $end]
        } elseif {$pos==[list 0 0]} {
            set pos [my beginOfEqual $pos]
            set end [list 0 0]
            set diffAtStart 1
        }
    }
}
