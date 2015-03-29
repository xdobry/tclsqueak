PrsArgumentMatcher instproc initSubcommands descs {
    my instvar subcommands
    set subcommands [list]
    if {[llength $descs]<=1} {
        return
    }
    foreach desc $descs {
        if {[lindex $desc 1 0 0] eq "const"} {
            lappend subcommands [lindex $desc 1 0 1]
        }
    }
}
