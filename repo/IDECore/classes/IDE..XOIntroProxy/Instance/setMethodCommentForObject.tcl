IDE::XOIntroProxy instproc setMethodCommentForObject {object vtype method comment} {
    # vtype is Class, Instance
    set desc [my getDescriptionForObject $object]
    if {$desc ne ""} {
        $desc setMethodComment $vtype $method $comment
    } else {
        IDE::CommentsContainer objectMethodSetComment $object $vtype $method $comment
    }
}
