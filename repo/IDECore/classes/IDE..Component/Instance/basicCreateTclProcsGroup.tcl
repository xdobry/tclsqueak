IDE::Component instproc basicCreateTclProcsGroup {name {withNamespace 0}} {
    set pobj [my getProcsGroupWithName $name]
    if {$pobj ne ""} {return $pobj}
    set pobj [IDE::ProcsGroup new -childof [self] -name $name -withNamespace $withNamespace]
    return $pobj
}
