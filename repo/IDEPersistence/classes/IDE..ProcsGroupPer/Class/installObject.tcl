IDE::ProcsGroupPer proc installObject obj {
    my makePersistentAble $obj
    $obj makePersistent
    $obj set userid [IDE::System getUserId]
    $obj importAllMethods
    $obj set versioninfo {[import] 1.0}
    $obj set isclosed 0
    $obj trackingOn
}
