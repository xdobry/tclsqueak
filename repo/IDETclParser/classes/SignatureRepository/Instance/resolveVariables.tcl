SignatureRepository instproc resolveVariables {} {
    my instvar variableArr methodsArr commandsArr
    set resolvedCount 0
    foreach k [array names variableArr] {
        set type $variableArr($k)
        if {[lindex $type 0] eq "unknown" && [llength $type]>0} {
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
                set rtype [lindex $mdef 0 $pos 0]
                set variableArr($k) $rtype
                incr resolvedCount
                tlog::ltrace {resolved variable=$k type=$rtype}
            }
        }
    }
    tlog::info "resolved variables count $resolvedCount"
    return $resolvedCount
}
