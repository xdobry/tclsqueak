IDE::VarsTracker proc addTrace {variable {operation write}} {
    my instvar traceArr
    if {![info exists $variable]} {
        IDE::Dialog message "$variable does not exists"
        return
    }
    if {[info exists traceArr($variable)] && [ide::lcontain $traceArr($variable) $operation]} {
        IDE::Dialog message "trace of type $operation already exists on $variable"
        my newBrowser
        return
    }
    if {$operation eq "write" || $operation eq "read"} {
        trace add variable $variable $operation idevarstrack::invokeDebugger
    }
    if {![info exists traceArr($variable)]} {
        #trace add variable $variable unset idevarstrack::unsetVariable
    }
    ide::addToValueForKey traceArr $variable $operation
    if {[Object isobject ide_vars_tracker]} {
        ide_vars_tracker addVariable $variable $traceArr($variable) $operation
    } elseif {$operation eq "watch"} {
        my newBrowser
    }
}
