MyUIClass instproc destroy {} {
    my instvar root
    if {[info exists root]} {
       ::destroy $root
    }
    next
}
