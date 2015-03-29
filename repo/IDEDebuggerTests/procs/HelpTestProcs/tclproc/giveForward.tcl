proc giveForward {} {
    set a 3
    incr a
    set b [expr {$a+2}]
    procWithHalt
    incr a
    set b [expr {$a+2}]
    set d 0
    for {set a 0} {$a<5} {incr a} {
        incr d $a
    }
    set d
}
