IDE::VarsView instproc selectItem var {
    my instvar vobject vtype vvariable
    if {$var eq ""} return
    set message "variable $var"
    set vvariable $var
    if {[my varAction array exists $var]} {
        set value [my varAction array get $var]
        set message "array $var"
        set vtype array
    } elseif {[my varAction info exists $var]} {
        set value [my varAction set $var]
        if {[Object isobject $value]} {
            if {[catch {$value printString} ps]} {
                set value $value
            } else {
                set value "$value\n$ps"
            }
            set vtype object
        } else {
            set vtype string
        }
    } else {
        set value UNKNOWN
        set vtype UNKNOWN
    }
    [my info parent] setVarValue $value [self]
    [my info parent] setStatusBarText $message
}
