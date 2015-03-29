POTHelper instproc prevEmptyItem {} {
    my instvar catalog item
    set x $item
    while {$x>0} {
        incr x -1
        set original [lindex $catalog $x]
        if {[msgcat::mc $original] eq $original} {
            my setItem $x
            return
        }
    }
}
