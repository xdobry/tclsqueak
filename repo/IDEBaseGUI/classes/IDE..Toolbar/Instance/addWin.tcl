IDE::Toolbar instproc addWin {btnwin pos} {
    my instvar winArr win
    if {![info exists winArr]} {
        pack $btnwin -side left -fill y
        set winArr($pos) $btnwin
    } else {
        set winArr($pos) $btnwin
        set sorted [lsort -real [array names winArr]]
        set id [lsearch -real -sorted $sorted $pos]
        if {$id==0} {
            pack $btnwin -side left -before $winArr([lindex $sorted 1]) -fill y
        } else {
            pack $btnwin -side left -after $winArr([lindex $sorted [expr {$id-1}]]) -fill y
        }
    }
}
