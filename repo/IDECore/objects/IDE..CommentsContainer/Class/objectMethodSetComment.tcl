IDE::CommentsContainer proc objectMethodSetComment {object type method comment} {
    set oc [my getObjectContainerWithCreate $object]
    $oc setMethodComment $type $method $comment
}
