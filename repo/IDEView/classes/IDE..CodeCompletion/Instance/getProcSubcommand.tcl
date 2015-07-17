IDE::CodeCompletion instproc getProcSubcommand {command pattern subcommands} {
    set mlist [list]
    foreach elem $subcommands {
        if {[string match $pattern $elem]} {
            lappend mlist $elem
        }
    }
    list $mlist $pattern
}
