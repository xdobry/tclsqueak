IDE::CBCodeController instproc handleMethod {skript {contentDesc {}}} {
    lassign $contentDesc class type method
    set introProxy [IDE::XOIntroProxy getIntroProxyForMethodType $type]
    if {$introProxy eq ""} {
        return
    }
    $introProxy handleScript $skript
    set editItem [$introProxy getItemFromScript $skript]
    lassign $editItem eclass etype emethod
    if {$class ne $eclass || $type ne $etype || $method ne $emethod} {
        my showNavigation $editItem
        [my info parent] methodedit updateTitle $contentDesc $editItem
    } else {
        [my info parent] methodedit notifyNotEdited $contentDesc
    }
    return $editItem
}
