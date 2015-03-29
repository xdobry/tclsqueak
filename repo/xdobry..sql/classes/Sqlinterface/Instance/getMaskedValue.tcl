Sqlinterface instproc getMaskedValue {value type} {
    if {$type eq "datetime" || $type eq "timestamp"} {
        return [my getTimeValue $value]
    } elseif {[my needEscape $type]} {
        return '[my escape $value]' 
    } else {
        return $value
    }
}
