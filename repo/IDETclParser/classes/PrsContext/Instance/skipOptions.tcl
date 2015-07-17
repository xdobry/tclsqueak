PrsContext instproc skipOptions {command startIdx options argOptions} {
    # ignore switches / options
    # return the new start position
    # the startIdx is usually 1 because it is the 2nd (idx=1) word in command
    set count [$command argsCount]
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
        if {$literal in $argOptions} {
            incr x
        }
    }
    return $x
}
