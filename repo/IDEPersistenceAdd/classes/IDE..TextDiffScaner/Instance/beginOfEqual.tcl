IDE::TextDiffScaner instproc beginOfEqual start {
    my instvar textLen1 textLen2
    # start is last equal lines index
    set s1 [expr {[lindex $start 0]+1}]
    set s2 [expr {[lindex $start 1]+1}]
    set r 1
    while {$s1+$r<=$textLen1 || $s2+$r<=$textLen2} {
        if {$s1+$r<$textLen1} {
            set line1 [my getLine1 [expr $s1+$r]]
            for {set x2 $s2} {$x2<$textLen2 && $x2-$s2<=$r} {incr x2} {
                set line2 [my getLine2 $x2]
                if {$line1==$line2} {return [list [expr $s1+$r] $x2]}
            }
        }
        if {$s2+$r<$textLen2} {
            set line2 [my getLine2 [expr $s2+$r]]
            for {set x1 $s1} {$x1<$textLen1 && $x1-$s1<=$r} {incr x1} {
                set line1 [my getLine1 $x1]
                if {$line1==$line2} {return [list $x1 [expr $s2+$r]]}
            }
        }

        incr r
    }
    return {}
}
