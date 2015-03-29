PrsElement instproc prsContentString {} {
    set offset [my getContentOffset]
    [[my getParser] stream] copyFromTo [expr {[my begin]+$offset}] [expr {[my end]-$offset}]
}
