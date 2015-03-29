IDE::ProgEdit instproc getProcSubcommand {command pattern subcommands} {
    set mlist [list]
    foreach elem $subcommands {
        if {[string match $pattern $elem]} {
            lappend mlist $elem
        }
    }
    my invokePopDown $mlist $pattern
}
