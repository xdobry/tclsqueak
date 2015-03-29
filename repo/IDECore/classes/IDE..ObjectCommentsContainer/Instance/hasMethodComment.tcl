IDE::ObjectCommentsContainer instproc hasMethodComment {type method} {
    return [expr {[my exists  comment_${type}($method)] &&
                  [my set comment_${type}($method)] ne ""}]
}
