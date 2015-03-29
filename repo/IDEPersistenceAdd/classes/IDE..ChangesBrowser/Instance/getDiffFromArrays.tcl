IDE::ChangesBrowser instproc getDiffFromArrays {a1_ref a2_ref} {
    upvar $a1_ref a1
    upvar $a2_ref a2
    set diff [list]
    if {[info exists a1]} {
        for {set sid [array startsearch a1]} {[array anymore a1 $sid]} {} {
            set obj [array nextelement a1 $sid]
            if {![info exists a2($obj)] || $a1($obj)!=$a2($obj)} {
                lappend diff $obj
            }
        }
        array donesearch a1 $sid
    }
    if {[info exists a2]} {
        for {set sid [array startsearch a2]} {[array anymore a2 $sid]} {} {
            set obj [array nextelement a2 $sid]
            if {![info exists a1($obj)]} {
                lappend diff $obj
            }
        }
        array donesearch a2 $sid
    }
    return $diff
}
