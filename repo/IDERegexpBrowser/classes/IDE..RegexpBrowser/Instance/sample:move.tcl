IDE::RegexpBrowser instproc sample:move amount {
    my instvar data
    if {$amount == -1} {
        if {$data(v:position) > 0} {
            incr data(v:position) -1
        }
    } else {
        if {$data(v:position) < [llength $data(v:positions)]-1} {
            incr data(v:position) +1
        }
    }
    set where [lindex $data(v:positions) $data(v:position)]
    if {$where != ""} {
        $data(w:sample) see $where
        $data(w:sample) mark set insert $where
        focus $data(w:sample)
    }
}
