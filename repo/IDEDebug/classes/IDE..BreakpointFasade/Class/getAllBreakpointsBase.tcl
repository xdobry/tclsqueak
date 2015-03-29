IDE::BreakpointFasade proc getAllBreakpointsBase {} {
    my instvar breakpointsArr
    set breakpoints [list]
    if {![array exists breakpointsArr]} return
    set indicator [array startsearch breakpointsArr]
    while {[array anymore breakpointsArr $indicator]} {
        set elem [array nextelement breakpointsArr $indicator]
        if {[Object isobject $breakpointsArr($elem)]} {
            lappend breakpoints $breakpointsArr($elem)
        }
    }
    array donesearch breakpointsArr $indicator
    return $breakpoints
}
