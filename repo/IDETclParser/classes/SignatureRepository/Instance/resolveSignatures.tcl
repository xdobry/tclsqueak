SignatureRepository instproc resolveSignatures {} {
    my instvar methodsArr commandsArr
    set resolvedCount 0
    foreach {k def} [array get methodsArr] {
        set dpos 0
        set changed 0
        foreach tdef [lindex $def 0] {
            set type [lindex $tdef 0]
            if {[lindex $type 0] eq "unknown" && [llength $type]>1} {
                # check if self reference
                if {[lindex $type 1 0] ne $k || [lindex $type 1 1]!=$dpos} {
                    lassign [lindex $type 1] method pos
                    if {[llength $method]==1} {
                        set isProc1 1
                        if {[catch {set commandsArr($method)} mdef]} {
                            continue
                        }
                    } else {
                        set isProc1 0
                        if {[catch {set methodsArr($method)} mdef]} {
                            continue
                        }
                    }
                    if {[lindex $mdef 0 $pos 0 0] ne "unknown"} {
                        lset def 0 $dpos 0 [lindex $mdef 0 $pos 0]
                        incr resolvedCount
                        set changed 1
                    }
                }
            }
            incr dpos
        }
        if {$changed} {
            set methodsArr($k) $def
        }
    }
    # TODO code dupplication
    foreach {k def} [array get commandsArr] {
        set dpos 0
        set changed 0
        foreach tdef [lindex $def 0] {
            set type [lindex $tdef 0]
            if {[lindex $type 0] eq "unknown" && [llength $type]>1} {
                # check if self reference
                if {[lindex $type 1 0] ne $k || [lindex $type 1 1]!=$dpos} {
                    lassign [lindex $type 1] method pos
                    if {[llength $method]==1} {
                        set isProc1 1
                        if {[catch {set commandsArr($method)} mdef]} {
                            continue
                        }
                    } else {
                        set isProc1 0
                        if {[catch {set methodsArr($method)} mdef]} {
                            continue
                        }
                    }
                    if {[lindex $mdef 0 $pos 0 0] ne "unknown"} {
                        lset def 0 $dpos 0 [lindex $mdef 0 $pos 0]
                        incr resolvedCount
                        set changed 1
                    }
                }
            }
            incr dpos
        }
        if {$changed} {
            set commandsArr($k) $def
        }
    }
    tlog::info "resolved signatures count $resolvedCount"
    return $resolvedCount
}
