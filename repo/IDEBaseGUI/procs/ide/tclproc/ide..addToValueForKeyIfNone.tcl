proc ide::addToValueForKeyIfNone {arr_ref key value} {
    upvar $arr_ref arr
    if {[info exists arr($key)]} {
        set lvalue $arr($key)
    } else {
        set lvalue {}
    }
    ide::lappendIfNone lvalue $value
    set arr($key) $lvalue
}
