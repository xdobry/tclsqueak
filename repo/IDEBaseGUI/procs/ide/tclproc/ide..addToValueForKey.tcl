proc ide::addToValueForKey {arr_ref key value} {
    upvar $arr_ref arr
    if {[info exists arr($key)]} {
        set lvalue $arr($key)
    } else {
        set lvalue {}
    }
    lappend lvalue $value
    set arr($key) $lvalue
}
