IDE::Component instproc createTclProcsGroup {name {withNamespace 0}} {
    set pobj [my basicCreateTclProcsGroup $name $withNamespace]
    my addProcsGroup $pobj
    return $pobj
}
