IDE::CommentsContainer proc objectSetComment {object comment} {
    set object [IDE::XOIntroProxy normalizeName $object]
    my set objComments($object) $comment
}
