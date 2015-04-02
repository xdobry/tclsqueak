IDE::RegexpBrowser instproc sample:colorize {} {
    my instvar data v:all v:line v:lineanchor v:linestop v:nocase
    # remove old tags
    foreach level $data(v:levels) {
        $data(w:sample) tag remove $level 1.0 end
    }
    set data(v:position) 0
    set data(v:positions) [list ]

    # set new tags
    set exp [$data(w:regexp) get 1.0 end-1char]
    if {$exp == ""} {
        set data(v:result) {}
        return
    }
    set result [eval regexp -inline -indices ${v:all}  ${v:line} ${v:lineanchor} ${v:linestop} ${v:nocase} --  [list $exp] [list [$data(w:sample) get 1.0 end]]]
    set data(v:result) $result
    set i 0
    foreach match $result {
        set start [$data(w:sample) index "1.0+[lindex $match 0]chars"]
        $data(w:sample) tag add e[expr $i % $data(v:nblevels)]  $start [$data(w:sample) index "1.0+[expr [lindex $match 1]+1]chars"]
        lappend data(v:positions) $start
        if {$i == 0} {
            $data(w:sample) see $start
        }
        incr i
    }
    # set nb of matches
    if {$data(v:nblevels)} {
        set nb 0
        foreach item $result {
            if {[lindex $item 0] <= [lindex $item 1]} {
                incr nb
            }
        }
        my set v_nbmatches "[expr $nb/$data(v:nblevels)] matches"
    } else {
        my set v_nbmatches "? matches"
    }
}
