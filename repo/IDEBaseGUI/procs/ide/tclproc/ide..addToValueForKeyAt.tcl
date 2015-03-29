proc ide::addToValueForKeyAt {arr_ref key value index} {
    upvar $arr_ref arr
    if {[info exists arr($key)]} {
        set lvalue $arr($key)
    } else {
        set lvalue {}
    }
    set arr($key) [linsert $lvalue $index $value]
}
