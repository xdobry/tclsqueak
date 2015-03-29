IDE::XOIntroProxy instproc getMethodCommentForObject {object vtype method} {
    set desc [my getDescriptionForObject $object]
    set vtype [IDE::XOIntroProxy getAbstractMethodType $vtype]
    if {$desc ne ""} {
        $desc getMethodComment $vtype $method
    } else {
        IDE::CommentsContainer objectMethodGetComment $object $vtype $method
    }
}
