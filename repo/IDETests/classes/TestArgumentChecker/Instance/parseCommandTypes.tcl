TestArgumentChecker instproc parseCommandTypes {parameters argDescs} {
    #puts "parsing '$parameters' '$argDescs'"

    set parLen [llength $parameters]
    set argDescLen [llength $argDescs]
    if {$argDescLen == 0 && $parLen == 0} {
        return
    }
    if {$argDescLen==0} {
        my parseError {} "unexpected arguments $argDescs"
    }
    lassign [my getArgDesc [lindex $argDescs 0]] mult type
    switch -exact -- $mult {
        * {
            if {$parLen==0} {
                return
            }
            set alltypes [list]
            for {set i 0} {$i<$parLen} {incr i} {
                if {![catch {my checkType [lrange $parameters $i end] $type} ptypes]} {
                    lappend alltypes {*}$ptypes
                    if {![catch {my parseCommandTypes [lrange $parameters [llength $alltypes] end] [lrange $argDescs 1 end]} ptypes2]} {
                       return [concat $alltypes $ptypes2]
                    }
                }
            }
            return [my parseCommandTypes $parameters [lrange $argDescs 1 end]]
        }
        ? {
            if {$parLen==0} {
                return
            }
            if {![catch {my checkType $parameters $type} ptypes]} {
                if {![catch {my parseCommandTypes [lrange $parameters [llength $ptypes] end] [lrange $argDescs 1 end]} ptypes2]} {
                    return [concat $ptypes $ptypes2]
                }
            }
            return [my parseCommandTypes $parameters [lrange $argDescs 1 end]]
        }
        + {
            if {$parLen==0} {
                my parseError {} "expect argument for type $type"
            }
            set alltypes [list]
            for {set i 0} {$i<$parLen} {incr i} {
                if {![catch {my checkType [lrange $parameters $i end] $type} ptypes]} {
                    lappend alltypes {*}$ptypes
                    if {![catch {my parseCommandTypes [lrange $parameters [llength $alltypes] end] [lrange $argDescs 1 end]} ptypes2]} {
                       return [concat $alltypes $ptypes2]
                    }
                }
            }
            my parseError [lindex $parameters 0] "unmatched type $type"
        }
        default {
            if {$parLen==0} {
                my parseError {} "expect argument for type $type"
            }
            set ptypes [my checkType $parameters $type]
            return [concat $ptypes [my parseCommandTypes [lrange $parameters [llength $ptypes] end] [lrange $argDescs 1 end]]]
        }
    }
    error "unmatched"
}
