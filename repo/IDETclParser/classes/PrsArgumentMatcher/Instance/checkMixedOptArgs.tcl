PrsArgumentMatcher instproc checkMixedOptArgs {parameters typeIndex} {
    my instvar fullName
    #puts "checking type '$type' for ''[join [ide::lcollect elem $parameters {$elem prsString}]]''"

    lassign $typeIndex type index
    set shift 0
    set parLen [llength $parameters]
    set types [list]
    set options [lindex $type 1]
    set argtypes [lrange $type 2 end]
    set argindex 0
    set argcount 0
    for {set shift 0} {$shift<$parLen} {incr shift} {
        set found 0
        set elem [lindex $parameters $shift]
        foreach {optName optType} $options {
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
            if {[$elem hasclass PrsLiteral] && [string index [$elem prsString] 0] eq "-"} {
               my parseError $elem "unexpected option for $type: $fullName" 
            }
            if {[llength $argtypes]>$argindex} {
                set atype [lindex $argtypes $argindex]
                lassign [ttype::getArgDesc $atype] mult atype
                lappend types [my checkTypeBase $elem [list $atype 0]]
                if {$mult ni {+ *}} {
                    incr argindex
                }
                incr argcount
            } else {
                break
            }
        }
    }
    if {[llength $argtypes]>$argindex} {
        set atype [lindex $argtypes $argindex]
        lassign [ttype::getArgDesc $atype] mult atype
        if {$mult ni {? * +} || ($mult eq "+" && $argcount==0)} {
            my parseError [lindex $parameters end] "missing mandatory argument for $atype: $fullName" 
        }
    }
    return $types
}
