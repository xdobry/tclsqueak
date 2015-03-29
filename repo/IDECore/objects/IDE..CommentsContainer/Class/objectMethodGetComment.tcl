IDE::CommentsContainer proc objectMethodGetComment {object type method} {
    set oc [my getObjectContainer $object]
    if {$oc eq ""} return
    $oc getMethodComment $type $method
}
