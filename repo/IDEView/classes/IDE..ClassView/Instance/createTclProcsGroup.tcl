IDE::ClassView instproc createTclProcsGroup {name withNamespace} {
    my instvar cobj
    if {![my canModifyComponent]} return

    $cobj createTclProcsGroup $name $withNamespace
    my setViewType Procs
}
