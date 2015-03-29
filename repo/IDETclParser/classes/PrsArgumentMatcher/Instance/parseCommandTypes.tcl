PrsArgumentMatcher instproc parseCommandTypes {parameters argDescs} {
    my instvar fullName
    #puts "parsing '[join [ide::lcollect elem $parameters {$elem prsString}]]' '$argDescs'"

    set parLen [llength $parameters]
    set argDescLen [llength $argDescs]
    if {$argDescLen == 0 && $parLen == 0} {
        return
    }
    if {$argDescLen==0} {
        my parseError [lindex $parameters 0] "unexpected parameter: $fullName"
    }
    lassign [lindex $argDescs 0] mult type index
    set type [list $type $index]
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
            return [my parseCommandTypes [lrange $parameters [llength $alltypes] end] [lrange $argDescs 1 end]]
        }
        ? {
            if {$parLen==0} {
                return [my parseCommandTypes $parameters [lrange $argDescs 1 end]]
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
                my parseError {} "expect argument for type $type: $fullName"
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
            my parseError [lindex $parameters 0] "unmatched type '$type': $fullName"
        }
        default {
            if {$parLen==0} {
                my parseError {} "expect argument for type $type: $fullName"
            }
            set ptypes [my checkType $parameters $type]
            set typcount [llength $ptypes]
            return [concat $ptypes [my parseCommandTypes [lrange $parameters $typcount end] [lrange $argDescs 1 end]]]
        }
    }
    my parseError {} "unmatched: $fullName"
}
