IDE::TextDiffScaner instproc endOfEqual start {
    my instvar textWin1 textLen1 textWin2 textLen2 diffAtEnd
    set l1 [lindex $start 0]
    set l2 [lindex $start 1]
    set ret {}
    while {$l1<$textLen1 && $l2<$textLen2} {
        set line1 [my getLine1 $l1]
        set line2 [my getLine2 $l2]
        if {$line1!=$line2} {
            break
        }
        set ret [list $l1 $l2]
        incr l1
        incr l2
    }
    if {$l1==$textLen1 || $l2==$textLen2} {
        set diffAtEnd 0
    }
    #[self] halt
    return $ret
}
