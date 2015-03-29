IDE::VarsTracker proc unsetVariable variable {
    puts "unseting variable $variable"
    my instvar traceArr
    if {![info exists traceArr($variable)]} {
        return
    }
    foreach op $traceArr($variable) {
        my removeTrace $variable $op
    }
}
