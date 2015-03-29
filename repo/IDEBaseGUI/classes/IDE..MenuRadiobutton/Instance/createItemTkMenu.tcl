IDE::MenuRadiobutton instproc createItemTkMenu {win tl_win} {
    my instvar name command value varname underline accelerator
    set par {}
    if {$accelerator ne "" && $tl_win ne ""} {
        if {[string index $accelerator 0] eq "_"} {
            set par "-accelerator [string range $accelerator 1 end]"
        } else {
            set par "-accelerator $accelerator"
        }
    }
    if {$underline ne ""} {
        append par " -underline $underline"
    }
    $win add radiobutton  -label $name -command $command -variable $varname -value $value {*}$par
    if {$accelerator ne "" && $tl_win ne ""} {
        if {[string index $accelerator 0] ne "_"} {
            bind $tl_win <$accelerator> [list $win invoke $name]
        }
    }
}
