IDE::VarsTracker proc refreshVariables {} {
    my instvar traceArr
    set indicator [array startsearch traceArr]
    while {[array anymore traceArr $indicator]} {
        set elem [array nextelement traceArr $indicator]
        if {![info exists $elem]} {
            foreach op $traceArr($elem) {
                my removeTrace $elem $op
            }
        }
    }
    array donesearch traceArr $indicator

}
