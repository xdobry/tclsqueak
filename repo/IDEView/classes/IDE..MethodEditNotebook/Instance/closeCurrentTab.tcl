IDE::MethodEditNotebook instproc closeCurrentTab {} {
    my instvar win methodEditObjects methodEditTabIds
    set tabid [$win select]
    if {$tabid eq ""} {
        return
    }
    set edit $methodEditObjects($tabid)
    if {[$edit askForModification]} {
        $win forget $tabid
        my removeContentRel $edit
        $edit destroy
        unset methodEditTabIds($edit)
        unset methodEditObjects($tabid)
        ::destroy $tabid
    }
}
