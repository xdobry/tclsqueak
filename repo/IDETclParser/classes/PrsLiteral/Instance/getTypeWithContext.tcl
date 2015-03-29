PrsLiteral instproc getTypeWithContext {context {suggestedType {}}} {
    my instvar type
    if {[info exists type]} {
        return $type
    }
    if {$suggestedType ne "" && [my canAssignTypeBase $suggestedType $context]} {
        set type $suggestedType
    } else {
        set content [my prsString]
        if {[string is integer $content]} {
            set type int
        } elseif {[string is double $content]} {
            set type double
        } elseif {[regexp {end(-\d+)?} $content]} {
            set type index
        } else {
            set type [list string [my getStringSubType]]
        }
    }
    return $type
}
