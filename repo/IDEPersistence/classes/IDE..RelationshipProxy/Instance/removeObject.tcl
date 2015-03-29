IDE::RelationshipProxy instproc removeObject obj {
    my instvar objectList
    my checkIndexList
    if {[set index [lsearch -exact $objectList $obj]]>=0} {
        set objectList [lreplace $objectList $index $index]
    } else {
        error "$obj not found in the list"
    }
}
