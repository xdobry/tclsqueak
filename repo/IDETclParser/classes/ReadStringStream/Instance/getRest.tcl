ReadStringStream instproc getRest {} {
    my instvar pos string lastpos
    if {[info exists lastpos]} {
        set epos $lastpos
    } else {
        set epos end
    }
    string range $string $pos $lastpos
}
