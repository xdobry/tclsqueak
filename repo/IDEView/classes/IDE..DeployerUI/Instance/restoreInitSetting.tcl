IDE::DeployerUI instproc restoreInitSetting {} {
    my instvar win type output components histOutputs startScript kitexe startScripts
    
    set startScript ""
    set histOutputs [IDE::InputCache getValuesCache deployouts_$type]
    set d [IDE::InputCache getValueCache deploydesc_$type]
    if {$type eq "exe"} {
        set kitexe [IDE::InputCache getValueCache deploy_kitexe]
        if {$kitexe eq ""} {
            set kitexe [my searchKitExe]
        }
    }
    if {[llength $components]==0} {
        if {[llength $d]>0} {
            if {[dict exists $d components]} {
                foreach c [dict get $d components] {
                    if {[IDE::Component getCompObjectForNameIfExist $c] ne ""} {
                        lappend components $c
                    }
                }
            }
            if {[dict exists $d startScript]} {
                set startScript [dict get $d startScript]
            }
        }
    } elseif {[llength $components]==1} {
        if {[llength $d]>0 && [dict exists $d components] && [lindex $components 0] in [dict get $d components]} {
            foreach c [dict get $d components] {
                if {[IDE::Component getCompObjectForNameIfExist $c] ne "" && $c ni $components} {
                    lappend components $c
                }
            }
            if {[dict exists $d startScript]} {
                set startScript [dict get $d startScript]
            }
            if {[dict exists $d output]} {
                set output [dict get $d output]
            }
        }
    }
    if {![info exists output]} {
        if {[llength $components]>0} {
            set name [lindex $components 0]
            switch $type {
                kit {
                    append name .kit
                }
                exe {
                    if {[IDE::System isWindowsPlatform]} {
                        append name .exe
                    } else {
                        append name .bin
                    }
                }
            }
            set output $name
        } else {
            set output ""
        }
    }
    set startScripts [my searchStartScripts]
    if {$startScript eq "" && [llength $components]>0} {
        set startScript [lindex $startScripts 0]
    }
}
