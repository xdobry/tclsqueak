IDE::GlobalVarsView instproc getVariablesInNamespace namespace {
    if {$namespace eq "::xotcl"} return
    set res [namespace eval $namespace ::info vars]
    ide::lremoveAll res [info globals]
    set res [ide::lcollect each $res {namespace eval $namespace [list namespace which -variable $each]}]
    foreach chns [namespace children $namespace] {
        if {[Object isobject $chns]} continue
        set res [concat $res [my getVariablesInNamespace $chns]]
    }
    return $res
}
