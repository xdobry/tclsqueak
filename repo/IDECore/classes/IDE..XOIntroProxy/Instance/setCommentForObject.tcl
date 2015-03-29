IDE::XOIntroProxy instproc setCommentForObject {object comment} {
    set desc [my getDescriptionForObject $object]
    if {$desc ne ""} {
        $desc setComment $comment
    } else {
        IDE::CommentsContainer objectSetComment $object $comment
    }
}
