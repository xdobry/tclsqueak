IDE::ProcsGroupPer instproc createProcForName name {
    set obj [next]
    IDE::TclProcsDescriptionPer addPersistence $obj
    return $obj
}
