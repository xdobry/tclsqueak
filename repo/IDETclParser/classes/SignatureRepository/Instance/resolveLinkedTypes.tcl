SignatureRepository instproc resolveLinkedTypes {} {
    my instvar linkTypes methodsArr commandsArr
    if {![info exists linkTypes]} {
        return
    }
    #foreach l $linkTypes {
    #    puts "lt $l"
    #}

    set resolvedCount 0
    set resolved 1
    set workLinkTypes $linkTypes
    while {$resolved} {
        set survived [list]
        set resolved 0
        foreach lt $workLinkTypes {
            lassign $lt link1 link2
            lassign $link1 method1 pos1
            lassign $link2 method2 pos2
            if {[llength $method1]==1} {
                set isProc1 1
                if {[catch {set commandsArr($method1)} mdef1]} {
                    continue
                }
            } else {
                set isProc1 0
                if {[catch {set methodsArr($method1)} mdef1]} {
                    continue
                }
            }
            if {[llength $method2]==1} {
                set isProc2 1
                if {[catch {set commandsArr($method2)} mdef2]} {
                    continue
                }
            } else {
                set isProc2 0
                if {[catch {set methodsArr($method2)} mdef2]} {
                    continue
                }
            }
            if {[lindex $mdef1 0 $pos1 0 0] eq "unknown"} {
                if {[lindex $mdef2 0 $pos2 0 0] eq "unknown"} {
                    # both unknown
                    lappend survived $lt
                } else {
                    set resolved 1
                    lset mdef1 0 $pos1 0 [lindex $mdef2 0 $pos2 0]
                    #puts "resolved '$mdef1' for $method1"
                    if {$isProc1} {
                        set commandsArr($method1) $mdef1
                    } else {
                        set methodsArr($method1) $mdef1
                    }
                    incr resolvedCount
                }
            } else {
                if {[lindex $mdef2 0 $pos1 0 0] eq "unknown"} {
                    set resolved 1
                    lset mdef2 0 $pos2 0 [lindex $mdef1 0 $pos1 0]
                    if {$isProc2} {
                        set commandsArr($method2) $mdef2
                    } else {
                        set methodsArr($method2) $mdef2
                    }
                    tlog::ltrace {resolve comand type $method2 def=$mdef2}
                    incr resolvedCount
                }
            }
        }
        set workLinkTypes $survived
    }
    tlog::info "resolved command types count $resolvedCount"
    return $resolvedCount
}
