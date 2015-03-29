IDE::ProcsGroupPer proc synchronize {obj id} {
    my makePersistentAble $obj
    $obj synchronizeWithId $id
}
