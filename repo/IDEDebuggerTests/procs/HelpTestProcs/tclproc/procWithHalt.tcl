proc procWithHalt {} {
    set a 2
    incr a
    set b [expr {$a+2}]
    set d 0
    atk::halt
    for {set a 0} {$a<5} {incr a} {
        incr d $a
    }
    set d
}
