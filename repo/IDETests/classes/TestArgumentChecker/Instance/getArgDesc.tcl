TestArgumentChecker instproc getArgDesc argDesc {
    set type unknown
    set mult {}
    set typeindex 0
    if {[lindex $argDesc 0] in {* ? +}} {
        set mult [lindex $argDesc 0]
        set typeindex 1
    }
    if {[llength $argDesc]>=$typeindex+1} {
        set type [lindex $argDesc $typeindex]
    }
    list $mult $type
}
