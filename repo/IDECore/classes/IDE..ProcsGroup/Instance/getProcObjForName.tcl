IDE::ProcsGroup instproc getProcObjForName name {
    set pobj [my getProcObjForNameIfExist $name]
    if {$pobj eq ""} {
        set pobj [my createProcForName $name]
    }
    return $pobj
}
