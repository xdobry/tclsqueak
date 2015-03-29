IDE::NSBrowser instproc getNamespacesAsList parent {
    my instvar ignoreXotcl
    set ret [list]
    foreach n [lsort [my inspectEval [list namespace children $parent]]] {
        if {$ignoreXotcl && ([Object isobject $n] || $n eq {::xotcl})} continue
        set fullname $n
        set elem $fullname
        lappend elem {*}[my getNamespacesAsList $fullname]
        lappend ret $elem
    }
    return $ret
}
