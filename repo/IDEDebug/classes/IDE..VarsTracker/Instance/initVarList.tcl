IDE::VarsTracker instproc initVarList {} {
    IDE::VarsTracker instvar traceArr
    my instvar varList
    set varList [list]
    if {![info exists traceArr]} return
    set indicator [array startsearch traceArr]
    set showList [list]
    while {[array anymore traceArr $indicator]} {
        set elem [array nextelement traceArr $indicator]
        lappend showList "$elem ($traceArr($elem))"
        lappend varList $elem
        if {[ide::lcontain $traceArr($elem) watch]} {
            my addWatchOn $elem
        }
    }
    array donesearch traceArr $indicator
    [self]::varlist setList $showList
}
