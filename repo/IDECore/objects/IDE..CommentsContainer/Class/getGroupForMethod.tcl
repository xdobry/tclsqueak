IDE::CommentsContainer proc getGroupForMethod method {
    if {[my exists proc_method($method)]} {
        return [lindex [my set proc_method($method)] 1]
    }
    return
}
