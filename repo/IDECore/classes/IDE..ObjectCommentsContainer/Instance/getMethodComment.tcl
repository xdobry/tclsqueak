IDE::ObjectCommentsContainer instproc getMethodComment {type method} {
    if {[my exists  comment_${type}($method)]} {
        return [my set comment_${type}($method)]
    }
    return
}
