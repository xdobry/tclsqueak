IDE::ComponentPersistence instproc createTclProcsGroupByLoading {name {withNamespace 0}} {
    set pobj [my basicCreateTclProcsGroup $name $withNamespace]
    IDE::ProcsGroupPer makePersistentAble $pobj
    $pobj trackingOff
    return $pobj
}
