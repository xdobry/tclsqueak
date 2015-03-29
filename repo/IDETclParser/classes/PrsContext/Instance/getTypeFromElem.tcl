PrsContext instproc getTypeFromElem elem {
    if {[$elem hasclass PrsVariable] || [$elem hasclass PrsVariableRef]} {
        set type [my getVariableType [$elem getVariableName]]
        if {[$elem isArray] && [lindex $type 0] eq "array"} {
            if {[llength $type]>1} {
                return [lindex $type 1]
            } else {
                return [list unknown]
            }
        }
        return $type
    } else {
        $elem getTypeWithContext [self]
    }
}
