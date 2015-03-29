IDE::XOIntroProxy instproc hasCommentForObject object {
    set desc [my getDescriptionForObject $object]
    if {$desc ne ""} {
        $desc hasComment
    } else {
        IDE::CommentsContainer objectHasComment $object
    }
}
