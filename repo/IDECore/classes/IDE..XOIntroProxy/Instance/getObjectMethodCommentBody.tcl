IDE::XOIntroProxy instproc getObjectMethodCommentBody {object type method} {
    set comment [IDE::CommentsContainer objectMethodGetComment $object $type $method]
    if {$comment eq ""} return
    if {$type eq "Class"} {
        set type proc
    } else {
        set type instproc
    }
    # !!! method parameter will be ignored

    return "@ [string trimleft $object :] $type $method {} \{\n[my asDescriptionList $comment]\n\}\n"
}
