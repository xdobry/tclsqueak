IDE::InputCache proc addValueCache {cache value} {
    my instvar cacheArr
    if {[catch {set cacheArr($cache)} values]} {
        set values [list]
    }
    set i 0
    foreach v $values {
        if {[lindex $v 0] eq $value} {
            lset values $i 1 [clock seconds]
            set cacheArr($cache) $values
            return
        }
        incr i
    }
    if {[llength $values]>10} {
        set values [lrange [lsort -index 1 -integer -decreasing $values] 0 9]
        lappend values [list $value [clock seconds]]
        set cacheArr($cache) $values
        return
    }
    lappend cacheArr($cache) [list $value [clock seconds]]
}
