IDE::MenuItem instproc migrateTkMenu {} {
    set add "    \$ms addMenuItem \[[[self] info class] new "
    foreach pr [[[self] info class] info parameter] {
        set name [lindex $pr 0]
        set value [lindex $pr 1]
        if {[my exists $name] && [my set $name]!=$value} {
            if {$name eq "command"} {
                append add " -command \[list \[self\] [my set $name]\]"
            } else {
                append add " -$name [list [my set $name]]"
            }
        }
    }
    puts $add
}
