PrsElement instproc printString {} {
    if {[my exists begin] && [my exists end]} {
        return "[my info class] ([my begin],[my end]) [[[my getParser] stream] copyFromTo [my begin] [my end]]"
    }
    next
}
