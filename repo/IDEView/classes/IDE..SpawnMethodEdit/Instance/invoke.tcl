IDE::SpawnMethodEdit instproc invoke {} {
    set text [[self]::methodedit getText]
    if { [lindex $text 0] eq "proc" } {
        IDE::System invokeTclProc [lindex $text 1]
    } else {
        set type [lindex $text 0]
        if { [Object isclass $type] } {
            switch [lindex $text 1] {
                "instproc" {
                    error "Can not direct call instance proc."
                }
                "proc" {
                    IDE::System invokeProc $type [lindex $text 2]
                }
                default {
                    error "Unknown method type to call."
                }
            }
        } else {
            error "Can call only proc or class proc."
        }
    }
}
