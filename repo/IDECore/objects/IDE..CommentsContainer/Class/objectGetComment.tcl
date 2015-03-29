IDE::CommentsContainer proc objectGetComment object {
    my instvar objComments
    set object [IDE::XOIntroProxy normalizeName $object]
    if {[info exists objComments($object)]} {
        return $objComments($object)
    }
}
