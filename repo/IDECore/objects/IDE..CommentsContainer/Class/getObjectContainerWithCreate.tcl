IDE::CommentsContainer proc getObjectContainerWithCreate object {
    set object [IDE::XOIntroProxy normalizeName $object]
    set c [my getObjectContainer $object]
    if {$c eq ""} {
        set c [IDE::ObjectCommentsContainer new -childof [self] -objectName $object]
        my set objectHash($object) $c
    }
    return $c
}
