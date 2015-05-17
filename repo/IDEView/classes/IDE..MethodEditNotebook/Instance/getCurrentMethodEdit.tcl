IDE::MethodEditNotebook instproc getCurrentMethodEdit {} {
    my instvar win methodEditObjects
    set tabid [$win select]
    if {$tabid eq ""} {
        return
    }
    return $methodEditObjects($tabid)
}
