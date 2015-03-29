IDE::ProcsGroup instproc importUnknownFromNamespace {} {
    my instvar name withNamespace
    if {!$withNamespace} return
    set existing [my getProcsNames]
    foreach p [namespace eval ::$name {info procs}] {
        set fullname ${name}::$p
        if {$fullname ni $existing} {
            set pobj [my getProcObjForName $fullname]
            if {[$pobj isPersistent]} {
                $pobj makePersistent
            }

        }
    }
}
