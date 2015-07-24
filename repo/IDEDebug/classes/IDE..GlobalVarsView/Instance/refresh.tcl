IDE::GlobalVarsView instproc refresh {} {
    my instvar win
    set varList [lsort -unique [concat [my getVariablesInNamespace ::] [info globals]]]
    set filter [$win.fframe.efilter get]
    if {$filter ne "*" || $filter ne ""} {
        set varList [ide::lselect each $varList {[string match $filter $each]}]
    }
    my setList $varList
}
