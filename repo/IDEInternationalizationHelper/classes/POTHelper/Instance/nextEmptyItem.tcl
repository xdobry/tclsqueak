POTHelper instproc nextEmptyItem {} {
    my instvar catalog item
    set x $item
    while {$x<[llength $catalog]} {
        incr x
        set original [lindex $catalog $x]
        if {[msgcat::mc $original] eq $original} {
            my setItem $x
            return
        }
    }
}
