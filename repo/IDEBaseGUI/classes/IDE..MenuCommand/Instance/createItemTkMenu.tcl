IDE::MenuCommand instproc createItemTkMenu {win tl_win} {
    my instvar accelerator underline name command
    set par {}
    if {$accelerator ne "" && $tl_win ne ""} {
        if {[string index $accelerator 0] eq "_"} {
            set par "-accelerator [string range $accelerator 1 end]"
        } else {
            set par "-accelerator $accelerator"
            bind $tl_win <$accelerator> $command
        }
    }
    if {$underline ne ""} {
        append par " -underline $underline"
    }
    $win add command -label $name -command $command {*}$par
}
