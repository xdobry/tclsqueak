PrsQuoted instproc getTypeWithContext {context {suggestedType {}}} {
    my instvar type
    if {[info exists type]} {
        return $type
    }
    if {$suggestedType ne "" && [my canAssignTypeBase $suggestedType]} {
        set type $suggestedType
    } else {
        if {[my isTkWidgetType $context]} {
            set type [list tk]
        } else {
            set type [list string [my getStringSubType]]
        }
    }
    return $type
}
