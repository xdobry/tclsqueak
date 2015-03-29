IDE::CommentsContainer proc searchCommentForMethod method {
    if {[my exists proc_comment($method)]} {
        [IDE::TclProcsDescription getMethodFor $method] setComment [my set proc_comment($method)]
    }
}
