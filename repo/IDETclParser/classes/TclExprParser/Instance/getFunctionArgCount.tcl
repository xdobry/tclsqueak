TclExprParser instproc getFunctionArgCount functName {
    my instvar functionsArr
    if {[info exists functionsArr($functName)]} {
        return [lindex $functionsArr($functName) 0]
    }
    return -2
}
