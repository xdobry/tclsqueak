IDE::XOIntroProxy instproc getObjectCommentBody object {
    set comment [IDE::CommentsContainer objectGetComment $object]
    if {$comment eq ""} return
    set cname [my stripNamespace [my getClassForObject $object]]
    set script "@ $cname [string trimleft $object :] \{\n[my asDescriptionList $comment]\n\}\n"
    return $script
}
