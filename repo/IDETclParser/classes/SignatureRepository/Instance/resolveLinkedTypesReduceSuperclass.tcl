SignatureRepository instproc resolveLinkedTypesReduceSuperclass {} {
    my instvar linkTypes methodsArr commandsArr
    if {![info exists linkTypes]} {
        return
    }

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
            if {[set type0 [lindex $mdef1 0 $pos1 0 0]] in {xotcl class} && $type0 eq [lindex $mdef2 0 $pos2 0 0] && [lindex $mdef1 0 $pos1 0 1] ne [lindex $mdef2 0 $pos2 0 1]} {
                set class1 [lindex $mdef1 0 $pos1 0]
                set class2 [lindex $mdef2 0 $pos2 0]
                set classM [lindex [my mergeOOTypes [list $class1 name] $class2] 0]
                tlog::ldebug {resolve supertype from link $lt = def1='[lindex $mdef1 0 $pos1]' def2='[lindex $mdef1 0 $pos1]' to $classM}
                lset mdef2 0 $pos2 0 $classM
                if {$isProc2} {
                    set commandsArr($method2) $mdef2
                } else {
                    set methodsArr($method2) $mdef2
                }
                lset mdef1 0 $pos1 0 $classM
                if {$isProc1} {
                    set commandsArr($method1) $mdef1
                } else {
                    set methodsArr($method1) $mdef1
                }
                incr resolvedCount
                set resolved 1
            } else {
                lappend survived $lt
            }
        }
        set workLinkTypes $survived
    }
    tlog::info "resolved linked types superclass reduction count $resolvedCount"
    return $resolvedCount
}
