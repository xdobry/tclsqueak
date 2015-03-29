IDE::ChangesBrowser instproc produceChangesScriptForXdobry {} {
    set comps [list]
    set coreComps [IDE::System getCoreComponentsAll]
    foreach c [IDE::Component getComponentNames] {
        if {[lsearch $coreComps $c]>=0} continue
        if {[string match xdobry::* $c]} {
            lappend comps $c
        }
    }
    my produceChangesScriptFor $comps
}
