IDE::TclScripEditor instproc checkScript script {
    set script [my getText]
    if {$script eq ""} {
       IDE::Dialog error "Nothing to evaluate"
       return 0
    } elseif {![info complete $script]} {
       IDE::Dialog error "value is not proper Tcl script"
       return 0
    }
    return 1
}
