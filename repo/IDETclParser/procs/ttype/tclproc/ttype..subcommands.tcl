proc ttype::subcommands descs {
    set subcommands [list]
    foreach d [lrange $descs 1 end] {
        if {[lindex $d 1 0 0] eq "const"} {
            lappend subcommands [lindex $d 1 0 1]
        }
    }
    return $subcommands
}
