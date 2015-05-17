IDE::MethodView instproc showLastEdited {} {
    my instvar editHistory
    set i 0
    foreach hitem [lreverse $editHistory] {
        if {[my checkItem $hitem]} {
            my selectHItemRefresh $hitem
            break
        }
        incr i
    }
    if {$i>0} {
        set editHistory [lrange $editHistory 0 end-$i]
    }
}
