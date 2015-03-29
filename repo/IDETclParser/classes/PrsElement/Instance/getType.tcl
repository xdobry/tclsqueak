PrsElement instproc getType {{sugestedType {}}} {
    my instvar type
    if {[info exists type]} {
        return $type
    } else {
        return [list unknown]
    }
}
