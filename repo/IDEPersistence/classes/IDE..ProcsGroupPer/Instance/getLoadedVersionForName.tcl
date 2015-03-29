IDE::ProcsGroupPer instproc getLoadedVersionForName name {
    set pobj [my getProcObjForNameIfExist $name]
    if {$pobj ne ""} {
        return [$pobj set methodid]
    } else {
        return 
    }
}
