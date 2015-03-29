IDE::XOIntroProxy instproc getCommentForObject object {
    set desc [my getDescriptionForObject $object]
    if {$desc ne ""} {
        $desc getComment
    } else {
        IDE::CommentsContainer objectGetComment $object
    }
}
