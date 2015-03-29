TclExprParser instproc getFunctionTypes functName {
    my instvar functionsArr
    if {[info exists functionsArr($functName)]} {
        return [lrange $functionsArr($functName) 1 end]
    }
    return
}
