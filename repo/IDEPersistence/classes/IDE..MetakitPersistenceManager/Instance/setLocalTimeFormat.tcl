IDE::MetakitPersistenceManager instproc setLocalTimeFormat {list_ref index} {
    if {$index<0} return
    upvar $list_ref list
    for {set x 0} {$x<[llength $list]} {incr x} {
        set time [lindex [lindex $list $x] $index]
        lset list [list $x $index] [clock format $time -format "%x - %X"]
    }
}
