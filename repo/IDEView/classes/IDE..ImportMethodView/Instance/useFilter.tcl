IDE::ImportMethodView instproc useFilter {} {
    my instvar win hideTclTk
    set filter [$win.efilter get]
    set methods [IDE::TclProcsDescription getAllUnRegisteredMethods]
    if {$filter ne "*"} {
        set methods [ide::lselect each $methods {[string match $filter $each]}]
    }
    if {$hideTclTk} {
        foreach pattern {::auto_* ::pkg_* ::tcl* ::tk*} {
            set methods [ide::lselect each $methods {![string match $pattern $each]}]
        }
        ide::lremoveAll methods {bgerror unknown}
    }
    [self]::methodlist setList [lsort -unique $methods]
}
