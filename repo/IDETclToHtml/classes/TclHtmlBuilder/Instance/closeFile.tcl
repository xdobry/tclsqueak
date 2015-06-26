TclHtmlBuilder instproc closeFile {} {
    my instvar out
    if {[info exists out]} {
        close $out
        unset out
    }
}
