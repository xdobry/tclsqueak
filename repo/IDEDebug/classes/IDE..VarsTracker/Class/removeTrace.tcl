IDE::VarsTracker proc removeTrace {variable {operation write}} {
    my instvar traceArr
    if {![info exists traceArr($variable)]} {
        return
    }
    if {$operation eq "write" || $operation eq "read"} {
        trace remove variable $variable $operation idevarstrack::invokeDebugger
    }
    set oplist $traceArr($variable)
    if {![ide::lcontain $oplist $operation]} return
    ide::lremove oplist $operation
    if {[llength $oplist]==0} {
        unset traceArr($variable)
    } else {
        set traceArr($variable) $oplist
    }
    if {[Object isobject ide_vars_tracker]} {
        ide_vars_tracker removeVariable $variable $oplist $operation
    }
}
