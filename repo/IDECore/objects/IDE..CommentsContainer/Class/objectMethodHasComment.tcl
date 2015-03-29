IDE::CommentsContainer proc objectMethodHasComment {object type method} {
    set oc [my getObjectContainer $object]
    if {$oc eq ""} {return 0}
    $oc hasMethodComment $type $method
}
