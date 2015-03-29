IDE::NSElements instproc getVariableContent var {
    my instvar vartype
    set message "variable $var"
    if {[my varAction array exists $var]} {
        set value [my varAction array get $var]
        set message "array $var"
        set vartype array
    } elseif {[my varAction info exists $var]} {
        set value [my varAction set $var]
        if {[Object isobject $value]} {
            if {[catch {$value printString} ps]} {
                set value $value
            } else {
                set value "$value\n$ps"
            }
            set vartype object
        } else {
            set vartype string
        }
    } else {
        set value UNKNOWN
        set vartype UNKNOWN
    }
    [my info parent] setStatusBarText $message
    return $value
}
