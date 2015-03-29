IDE::ProcsGroup instproc deleteMethod method {
    set pobj [my getProcObjForNameIfExist $method]
    if {$pobj eq ""} { error "no such method $method"}
    my removeMethodObj $pobj
}
