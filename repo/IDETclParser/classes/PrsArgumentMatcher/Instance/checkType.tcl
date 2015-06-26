PrsArgumentMatcher instproc checkType {parameters typeIndex} {
    my instvar fullName
    #puts "checking type '$type' for ''[join [ide::lcollect elem $parameters {$elem prsString}]]''"

    lassign $typeIndex type index
    if {[llength $type]>1 && [lindex $type 0] eq "option"} {
        set shift 0
        set parLen [llength $parameters]
        set types [list]
        for {set shift 0} {$shift<$parLen} {incr shift} {
            set found 0
            set elem [lindex $parameters $shift]
            foreach {optName optType} [lrange $type 1 end] {
                if {[$elem isLiteral $optName]} {
                    set found 1
                    if {$optType ne ""} {
                        incr shift
                        if {$shift<$parLen} {
                            lappend types _
                            set elem [lindex $parameters $shift]
                            # we do not check the opt types here but only in applyTypes step
                            # lappend types [lindex [my checkTypeBase $elem $optType] 0]
                            lappend types [list $optType $index]
                        } else {
                            my parseError $elem "expect option parameter for $type: $fullName"
                        }
                    } else {
                        lappend types _
                    }
                }
            }
            if {!$found} {
                break
            }
        }
        return $types
    } elseif {[llength $type]>1 && [lindex $type 0] eq "mixedoptargs"} {
        my checkMixedOptArgs $parameters $typeIndex
    } else {
        my checkTypeBase [lindex $parameters 0] $typeIndex
    }
}
