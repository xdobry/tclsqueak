IDE::MethodView instproc backMethod {} {
    my instvar history historyIndex
    while {$historyIndex>=1} {
        incr historyIndex -1
        set hitem [lindex $history $historyIndex]
        if {[my checkItem $hitem]} {
            my selectHItemRefresh $hitem
            break
        }
        set history [lreplace $history $historyIndex $historyIndex]
    }
}
