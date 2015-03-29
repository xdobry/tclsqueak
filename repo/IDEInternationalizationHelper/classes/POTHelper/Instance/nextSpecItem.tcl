POTHelper instproc nextSpecItem {} {
    my instvar catalog item
    set lng [lindex [split [::msgcat::mclocale] _ ] 0]
    set x $item
    while {$x<[llength $catalog]} {
        incr x
        set original [lindex $catalog $x]
        if {[set trans [msgcat::mc $original]] ne $original} {
            set volist [regexp -all -inline {%s} $original]
            set vtlist [regexp -all -inline {%s} $trans]
            if {[llength $volist]!=[llength $vtlist]} {
                my setItem $x
                return
            }
        }
    }
}
