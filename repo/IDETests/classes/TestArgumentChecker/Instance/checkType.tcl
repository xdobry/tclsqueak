TestArgumentChecker instproc checkType {parameters type} {
    #puts "checking type '$type' for '$parameters'"
    if {[llength $type]>1 && [lindex $type 0] eq "option"} {
        set shift 0
        set parLen [llength $parameters]
        set types [list]
        for {set shift 0} {$shift<$parLen} {incr shift} {
            set found 0
            set elem [lindex $parameters $shift]
            foreach {optName optType} [lrange $type 1 end] {
                if {$optName eq $elem} {
                    set found 1
                    if {$optType ne ""} {
                        incr shift
                        if {$shift<$parLen} {
                            lappend types _
                            set elem [lindex $parameters $shift]
                            lappend types [my checkTypeBase $elem $optType]
                        } else {
                            my parseError $elem "expect option parameter for $type"
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
    } else {
        my checkTypeBase [lindex $parameters 0] $type
    }
}
