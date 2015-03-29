IDE::Browser instproc destroy {} {
    my instvar win
    if {[info exists win]} {
       ::destroy $win
    }
    next
}
