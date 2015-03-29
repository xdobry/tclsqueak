IDE::TclModeEdit instproc getBodyStart {} {
    my instvar vclass vctype method
    set text [my getText]
    if {$vctype eq "Tcl Procs"} {
        set elem 3
    } else {
        set elem 4
    }
    string first [lindex $text $elem] $text
}
