IDE::RegexpBrowser instproc regexp:colorize {} {
    my instvar data

    set exp [$data(w:regexp) get 1.0 end-1char]
    set max [string length $exp]
    set stack {}
    # list format : min max min max ...
    set indices [list "report" 0 [string length $exp]]
    # search the groups in the regexp
    set data(v:nblevels) 1
    for {set i 0} {$i < $max} {incr i} {
        set c [string index $exp $i]
        if {$c == "\\"} {
            incr i
            continue
        } elseif {$c == "("} {
            set c [string index $exp [expr $i+1]]
            set what [string index $exp [expr $i+2]]
            # test for escape with (?...)
            if {$c == "?"} {
                if {$what != ":"} {
                    lappend indices "lookahead"
                } else {
                    lappend indices "noreport"
                }
            } else {
                lappend indices "report"
                incr data(v:nblevels)
            }
            lappend indices $i
            set stack "[llength $indices] $stack"
            lappend indices 0

        } elseif {$c == ")"} {
            set idx [lindex $stack 0]
            if {$idx == ""} {
                continue
            }
            set stack [lrange $stack 1 end]
            set indices [lreplace $indices $idx $idx $i]
        }
    }

    # remove old colors
    foreach level $data(v:levels) {
        $data(w:regexp) tag remove $level 1.0 end
    }
    $data(w:regexp) tag remove "lookahead" 1.0 end
    $data(w:regexp) tag remove "noreport" 1.0 end
    # colorize the regexp
    set i 0
    foreach {type min max} $indices {
        if {$type != "report"} {
            continue
        }
        $data(w:regexp) tag add [lindex $data(v:levels) $i]  [$data(w:regexp) index "1.0+${min}chars"]  [$data(w:regexp) index "1.0+[expr $max+1]chars"]
        incr i
    }
    # apply special item
    foreach {type min max} $indices {
        if {$type == "report"} {
            continue
        }
        $data(w:regexp) tag add $type  [$data(w:regexp) index "1.0+${min}chars"]  [$data(w:regexp) index "1.0+[expr $max+1]chars"]
    }
}
