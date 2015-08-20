proc ttype::hasUniqueSubcommands descs {
    set subcommands [list]
    foreach d [lrange $descs 1 end] {
        if {[lindex $d 1 0 0] eq "const"} {
            set scommand [lindex $d 1 0 1]
            if {$scommand in $subcommands} {
                return 0
            }
            lappend subcommands $scommand
        } else {
            return 0
        }
    }
    return 1
}
