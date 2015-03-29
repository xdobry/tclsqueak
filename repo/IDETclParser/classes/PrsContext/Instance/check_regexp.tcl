PrsContext instproc check_regexp {count command notifier} {
    # ignore switches / options
    for {set x 1} {$x<$count} {incr x} {
        set elem [$command getElem $x]
        if {[$elem hasclass PrsLiteral] && [$elem prsString] eq "--"} {
            incr x
            break
        }
        if {![$elem hasclass PrsLiteral]} {
            break
        }
        set literal [$elem prsString]
        if {$literal in {-about -expanded -indices -line -linestop -lineanchor -nocase -all -inline}} {
            continue
        }
        if {$literal eq "-start"} {
            incr x
        }
    }
    incr x 2
    for {} {$x<=$count} {incr x} {
        my addVariableFrom [$command getElem $x] $notifier
    }
}
