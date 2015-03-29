SignatureRepository instproc getStat {} {
    my instvar xotclObjectsArr commandsArr methodsArr variableArr
    set ret ""
    if {[array exists commandsArr]} {
        append ret "commands: [llength [array names commandsArr]]"
    }
    if {[array exists xotclObjectsArr]} {
        append ret " objects: [llength [array names xotclObjectsArr]]"
    }
    if {[array exists methodsArr]} {
        append ret " methods: [llength [array names methodsArr]]"
    }
    if {[array exists variableArr]} {
        append ret " variables: [llength [array names variableArr]]"
    }
    append ret "\n"
    set params 0
    set unknowns 0
    if {[array exists methodsArr]} {
        foreach {key value} [array get methodsArr] {
            foreach desc $value {
                foreach p $desc {
                    if {[lindex $p 0 0] eq "unknown"} {
                        incr unknowns
                    }
                    incr params
                }
            }
        }
    }
    if {[array exists commandsArr]} {
        foreach {key value} [array get commandsArr] {
            foreach desc $value {
                foreach p $desc {
                    if {[lindex $p 0 0] eq "unknown"} {
                        incr unknowns
                    }
                    incr params
                }
            }
        }
    }
    set variables 0
    set unknownVariables 0
    if {[array exists variableArr]} {
        foreach {key value} [array get variableArr] {
            incr variables
            if {[lindex $value 0] eq "unknown"} {
                incr unknownVariables
            }
        }
    }
    append ret "signature params $params unknown: $unknowns"
    if {$params>0} {
        append ret " [format %.2f [expr {double($unknowns)/$params*100}]]%"
    }
    if {$variables>0} {
        append ret " unknown variables [format %.2f [expr {double($unknownVariables)/$variables*100}]]%"
    }
    return $ret
}
