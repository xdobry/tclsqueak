PrsContext instproc importErrors {subcontext offset} {
    my instvar errors
    if {[$subcontext hasErrors]} {
        foreach err [$subcontext set errors] {
            lassign $err start end message
            incr start $offset
            incr end $offset
            lappend errors [list $start $end $message]
        }
    }
}
