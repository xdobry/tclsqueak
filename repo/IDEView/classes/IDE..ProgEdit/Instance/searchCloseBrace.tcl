IDE::ProgEdit instproc searchCloseBrace {text obrace cbrace} {
    set len [string length $text]
    set open 0
    set rexpr "\[\\$obrace\\$cbrace\\\\\]"
    set x 0
    while {[regexp -indices -start $x $rexpr $text found]} {
        set x [lindex $found 0]
        set c [string index $text $x]
        if {$c eq "\\"} {
            incr x
        } elseif {$c eq $obrace} {
            incr open
        } elseif {$c eq $cbrace} {
            incr open -1
            if {$open==0} {
                return $x
            }
        }
        incr x
    }
    return -1
}
