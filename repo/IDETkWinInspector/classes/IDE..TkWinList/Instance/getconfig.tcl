IDE::TkWinList instproc getconfig {w {cmd configure}} {
    set args {}
    foreach x [eval $w $cmd] {
        if {[set opt [lindex $x 4]] != [lindex $x 3]} {lappend args [list [lindex $x 0] $opt]}
    }
    return [join $args]
}
