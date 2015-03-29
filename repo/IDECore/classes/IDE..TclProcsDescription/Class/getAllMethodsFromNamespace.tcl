IDE::TclProcsDescription proc getAllMethodsFromNamespace namespace {
    if {$namespace eq "::xotcl"} return
    set res [namespace eval $namespace ::info procs]
    set res [ide::lcollect each $res {namespace eval $namespace [list namespace which -command $each]}]
    foreach chns [namespace children $namespace] {
        if {[Object isobject $chns]} continue
        set res [concat $res [my getAllMethodsFromNamespace $chns]]
    }
    return $res
}
