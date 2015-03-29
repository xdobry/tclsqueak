IDE::CommentsContainer proc searchCommentForGroup gobj {
    my instvar proc_groupcomment
    set key [$gobj getObjectName]_[[$gobj getComponent] getName]
    if {[my exists proc_groupcomment($key)]} {
        $gobj setComment $proc_groupcomment($key)
    }
}
