IDE::ProgEdit instproc searchOpenBrace {text obrace cbrace} {
    set len [string length $text]
    set open 0
    for {set x $len} {$x>0} {incr x -1} {
        set c [string index $text $x]
        if {[string index $text [expr {$x-1}]] eq "\\"} {
            incr x -1
            continue
        }
        if {$c eq $obrace} {
            incr open
        } elseif {$c eq $cbrace} {
            incr open -1
            if {$open==0} {return [expr {$len-$x}]}
        }
    }
    return -1
}
