IDE::XOIntroProxy instproc hasMethodCommentForObject {object vtype method} {
    set desc [my getDescriptionForObject $object]
    if {$desc ne ""} {
        $desc hasMethodComment $vtype $method
    } else {
        IDE::CommentsContainer objectMethodHasComment $object $vtype $method
    }
}
