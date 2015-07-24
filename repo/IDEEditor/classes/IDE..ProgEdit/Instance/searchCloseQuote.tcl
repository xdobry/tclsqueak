IDE::ProgEdit instproc searchCloseQuote text {
    set len [string length $text]
    for {set x 1} {$x<$len} {incr x} {
        set c [string index $text $x]
        if {$c eq "\\"} {
            incr x
            continue
        }
        if {$c eq "\""} {
            return $x
        }
    }
}
