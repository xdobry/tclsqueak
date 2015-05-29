IDE::MethodEditNotebook instproc getCurrentMethodEdit {} {
    my instvar win methodEditObjects
    set tabid [$win select]
    if {$tabid eq ""} {
        return
    }
    #ttc rettype xotcl IDE::MethodEdit
    return $methodEditObjects($tabid)
}
