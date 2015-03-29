IDE::ObjectCache proc getInstance {class pkValue} {
    regsub -all :: $class {} name
    set arrname cache_$name
    if {[my exists ${arrname}($pkValue)]} {
        return [my set ${arrname}($pkValue)]
    } else {
        return
    }
}
