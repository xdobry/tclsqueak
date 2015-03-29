IDE::MenuStruct instproc checkEnable win {
    set i 0
    # check the main parent enablement
    set gneedstate normal
    foreach e [my enableList] {
        set gneedstate disabled
        if {![info exists sarr($e)]} {
            set sarr($e) [[my enablementHandler] $e]
        }
        if {$sarr($e)} {set gneedstate normal}
        if {$gneedstate eq "disabled"} break
    }
    foreach m [my set menuItems] {
        if {[$m istype IDE::MenuStruct]} {
            $m checkEnable [$win entrycget $i -menu]
            incr i
            continue
        }
        if {[llength [$m enableList]]==0 || ($gneedstate eq "disabled"
                                             && [lindex [$m enableList] 0] ne "noglobal")} {
            if {![$m istype IDE::MenuSeparator]} {
                if {[$win entrycget $i -state] ne $gneedstate} {
                    $win entryconfigure $i -state $gneedstate
                }
            }
            incr i
            continue
        }
        set needstate normal
        foreach e [$m enableList] {
            if {$e eq "noglobal"} continue
            set needstate disabled
            if {![info exists sarr($e)]} {
                set sarr($e) [[my enablementHandler] $e]
            }
            if {$sarr($e)} {set needstate normal}
            if {$needstate eq "disabled"} break
        }
        if {[$win entrycget $i -state] ne $needstate} {
            $win entryconfigure $i -state $needstate
        }
        incr i
    }
}
