PrsArgumentMatcher instproc isUniqueSubcommand {subname targetSubCommand} {
    my instvar subcommands
    if {[llength $subcommands]==0} {
        return 0
    }
    set sublen [string length $subname]
    incr sublen -1
    set matchedSubcommand ""
    foreach subcommand $subcommands {
        if {[string range $subcommand 0 $sublen] eq $subname && $subcommand eq $targetSubCommand} {
            if {$matchedSubcommand ne ""  && $matchedSubcommand ne $subcommand} {
                return 0
            } else {
                set matchedSubcommand $subcommand
            }
        }
    }
    expr {$matchedSubcommand ne ""}
}
