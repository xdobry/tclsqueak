IDE::CommentsContainer proc destroyObject object {
    set object [IDE::XOIntroProxy normalizeName $object]
    if {[my exists objComments($object)]} {
         my unset objComments($object)
    }
    set oc [my getObjectContainer $object]
    if {$oc ne ""} {
        $oc destroy
        my unset objectHash($object)
    }
}
