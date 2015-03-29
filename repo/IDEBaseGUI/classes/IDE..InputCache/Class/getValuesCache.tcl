IDE::InputCache proc getValuesCache cache {
    my instvar cacheArr
    if {[catch {set cacheArr($cache)} values]} {
        return
    } else {
        return [ide::lcollect elem [lsort -index 1 -integer -decreasing $values] {lindex $elem 0}]
    }
}
