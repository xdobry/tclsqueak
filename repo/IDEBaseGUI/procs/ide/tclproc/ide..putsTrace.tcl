proc ide::putsTrace {commandString ops} {
    switch [llength $commandString] {
        2 {
            ::transcript log "[lindex $commandString 1]\n"
        }
        3 {
            if {[lindex $commandString 1] eq "-nonewline"} {
                ::transcript log "[lindex $commandString 2]"
            }
        }
    }
}
