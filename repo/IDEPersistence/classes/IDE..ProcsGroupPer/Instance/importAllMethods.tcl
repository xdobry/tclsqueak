IDE::ProcsGroupPer instproc importAllMethods {} {
    foreach obj [my getProcsObjects] {
        IDE::TclProcsDescriptionPer addPersistence $obj
        $obj makePersistent
        $obj updateRelationship
    }
    my set versioninfo {[importing] 1.0}
}
