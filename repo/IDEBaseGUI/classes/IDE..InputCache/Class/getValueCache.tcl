IDE::InputCache proc getValueCache cache {
    my instvar cacheArr
    if {[catch {set cacheArr($cache)} value]} {
        return
    } else {
        return $value
    }
}
